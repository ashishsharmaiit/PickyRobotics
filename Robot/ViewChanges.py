import argparse
import asyncio
import json
import logging
import os
import platform
import ssl
import time
import websockets
from functools import partial, wraps

from aiohttp import web
from aiortc import RTCPeerConnection, RTCSessionDescription, RTCOutboundRtpStreamStats
from aiortc.contrib.media import MediaPlayer, MediaRelay
from aiortc.rtcrtpsender import RTCRtpSender

# **** ROS ****
import rospy
from web_joystick_control.msg import JoystickData
# **** ROS ****



ROOT = os.path.dirname(__file__)

offercount = 0



def create_local_tracks(play_from, decode):
    global relay1, relay2, webcam1, webcam2

    if play_from:
        player = MediaPlayer(play_from, decode=decode)
        return player.audio, player.video
    else:
        relay1 = MediaRelay()
        relay2 = MediaRelay()
        return None, relay1.subscribe(webcam1.video), relay2.subscribe(webcam2.video)

def force_codec(pc, sender, forced_codec):
    kind = forced_codec.split("/")[0]
    codecs = RTCRtpSender.getCapabilities(kind).codecs
    transceiver = next(t for t in pc.getTransceivers() if t.sender == sender)
    transceiver.setCodecPreferences(
        [codec for codec in codecs if codec.mimeType == forced_codec]
    )

pcs = set()

async def on_channel_message(data_channel, message):
    print('Received message on data channel:', message)
    data_channel.send('Hello Back from Python!')
    # *** ROS ****
    joystick_data = json.loads(message)
    try:
        # Extract the data from the received message
        frameid_msg = joystick_data["id"]
        timestamp_msg = rospy.Time.from_sec(joystick_data["timestamp"])
        axes_msg = joystick_data["axes"]
        buttons_msg = [1 if button["value"] else 0 for button in joystick_data["buttons"]]
        joystick_data_msg = JoystickData(stamp=timestamp_msg, frame_id=frameid_msg, axes=axes_msg, buttons=buttons_msg)
        # Publish the message on the /joystick_data topic
        joystick_data_pub.publish(joystick_data_msg)

    except Exception as e:
        rospy.logerr("Error processing joystick data: %s", str(e))
    # *** ROS ***
    
    

def partial_async(func, *args, **kwargs):
    async def wrapped(*args2, **kwargs2):
        return await func(*args, *args2, **kwargs, **kwargs2)
    return wrapped

async def websocket_client():
    global offercount, webcam1, webcam2
    uri = "ws://54.218.1.229:8084/"  # replace with your WebSocket server's URI
    async with websockets.connect(uri) as websocket:
        async for message in websocket:
            data = json.loads(message)
            if data['type'] == 'offer':
                print("Received offer", data)
                offercount += 1
                print ("This offer's count is ",offercount)
                if offercount == 1:
                    print ("triggering offer count = 0 function")
                    options1 = {"framerate": data['frame1'], "video_size": data['video_size1']}
                    options2 = {"framerate": data['frame2'], "video_size": data['video_size2']}
                    webcam1 = MediaPlayer("/dev/video1", format="v4l2", options=options1)
                    webcam2 = MediaPlayer("/dev/video0", format="v4l2", options=options2)
                    print("frame1",data['frame1'],"frame2",data['frame2'],"video_size1",data['video_size1'],"video_size2",data['video_size2'],"codec1",data['codec1'],"codec2",data['codec2'],"audio_codec",data['audio_codec'])
                if offercount > 1:
                        print ("triggering offer count > 1 function")
                        coros = [pc.close() for pc in pcs]
                        await asyncio.gather(*coros)
                        pcs.clear()
                sdp = data['sdp']
                offer = RTCSessionDescription(sdp=sdp, type='offer')

                pc = RTCPeerConnection()
                pcs.add(pc)

                # Create a data channel and add it to the connection
                data_channel = pc.createDataChannel('dataChannel')
                data_channel.on("message", partial(on_channel_message, data_channel))
                data_channel.on("open", lambda: print("Data channel opened"))

                @pc.on("connectionstatechange")
                async def on_connectionstatechange():
                    print("Connection state is %s" % pc.connectionState)
                    if pc.connectionState == "failed":
                        await pc.close()
                        pcs.discard(pc)

                # open media source
                audio, video1, video2 = create_local_tracks(
                    args.play_from, decode=not args.play_without_decoding
                )

                if audio:
                    print("Adding Audio")
                    audio_sender = pc.addTrack(audio)
                    if data['audio_codec']:
                        force_codec(pc, audio_sender, data['audio_codec'])
                    else:
                        print("No Audio Encoding 1")

                if video1:
                    print("Adding video1")
                    video1_sender = pc.addTrack(video1)
                    if data['codec1']:
                        force_codec(pc, video1_sender, data['codec1'])
                    else:
                        print("No Video Encoding 1")

                if video2:
                    print("Adding video2")
                    video2_sender = pc.addTrack(video2)
                    if data['codec2']:
                        force_codec(pc, video2_sender, data['codec2'])
                    else:
                        print("No Video Encoding 2")

                await pc.setRemoteDescription(offer)

                answer = await pc.createAnswer()
                await pc.setLocalDescription(answer)

                # send the answer back to the WebSocket server
                answer = {"sdp": pc.localDescription.sdp, "type": pc.localDescription.type}
                await websocket.send(json.dumps(answer))

async def on_shutdown(app):
    # close peer connections
    coros = [pc.close() for pc in pcs]
    await asyncio.gather(*coros)
    pcs.clear()

if __name__ == "__main__":

    # ************* ROS **********
    rospy.init_node("web_joystick_node")
    rospy.loginfo("Websocket client node initialized")
    joystick_data_pub = rospy.Publisher("/joystick_data", JoystickData, queue_size= 10)
    # ****************************
    
    parser = argparse.ArgumentParser(description="WebRTC webcam demo")
    parser.add_argument("--cert-file", help="SSL certificate file (for HTTPS)")
    parser.add_argument("--key-file", help="SSL key file (for HTTPS)")
    parser.add_argument("--play-from", help="Read the media from a file and sent it.")
    parser.add_argument(
        "--play-without-decoding",
        help=(
            "Read the media without decoding it (experimental). "
            "For now it only works with an MPEGTS container with only H.264 video."
        ),
        action="store_true",
    )
    parser.add_argument(
        "--host", default="0.0.0.0", help="Host for HTTP server (default: 0.0.0.0)"
    )
    parser.add_argument(
        "--port", type=int, default=8080, help="Port for HTTP server (default: 8080)"
    )
    parser.add_argument("--verbose", "-v", action="count")

    args = parser.parse_args()

    if args.verbose:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.INFO)

    if args.cert_file:
        ssl_context = ssl.SSLContext()
        ssl_context.load_cert_chain(args.cert_file, args.key_file)
    else:
        ssl_context = None

    # Start the WebSocket client
    asyncio.get_event_loop().run_until_complete(websocket_client())
    
    #*** ROS ***
    rospy.spin()
    #*** ROS *** 
