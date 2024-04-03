import asyncio
import json
from aiortc import RTCPeerConnection, RTCSessionDescription
from aiortc.contrib.media import MediaPlayer, MediaRelay
from aiortc.rtcrtpsender import RTCRtpSender
# *** ROS Comment from here***


from geometry_msgs.msg import Point
from std_msgs.msg import Bool
from std_msgs.msg import String
import rospy
from web_joystick_control.msg import JoystickData

# *** ROS Comment till here***


class WebRTCManager:

    def __init__(self, send_message, video1_path, video2_path, data_channel_required):
        self.offer_count = 0
        self.pcs = set()
        self.send_message = send_message
        self.data_channel = None
        self.webcam1 = None
        self.webcam2 = None
        self.video1_path = video1_path
        self.video2_path = video2_path
        self.data_channel_required = data_channel_required
        # *** ROS Comment from here***

        
        self.clicked_point_pub = rospy.Publisher('/clicked_point', Point, queue_size=10)
        self.trigger_arm_pub = rospy.Publisher('/trigger_arm', Bool, queue_size=10)
        self.joystick_data_pub = rospy.Publisher("/joystick_data", JoystickData, queue_size= 10)
        self.operation_mode_pub = rospy.Publisher("/operation_mode", String, queue_size= 10)
        
        # *** ROS Comment till here***


    def force_codec(self, pc, sender, forced_codec):
        kind = forced_codec.split("/")[0]
        codecs = RTCRtpSender.getCapabilities(kind).codecs
        transceiver = next(t for t in pc.getTransceivers() if t.sender == sender)
        transceiver.setCodecPreferences(
            [codec for codec in codecs if codec.mimeType == forced_codec]
        )


    async def send_data(self, data):
        """
        Send data over the data channel.
        """
        if self.data_channel and self.data_channel.readyState == "open":
            self.data_channel.send(data)
        else:
            print("Data channel is not open or not yet initialized!")


    # *** ROS Comment from here***

    def check_mode(self, webrtc_data):
        if (webrtc_data["mode"] == "manual"):
            teleoperation_mode = "MANUAL"
            self.operation_mode_pub.publish(teleoperation_mode)
        elif (webrtc_data["mode"] == "auto"):
            teleoperation_mode = "AUTO"
            self.operation_mode_pub.publish(teleoperation_mode)
        return teleoperation_mode

    
    # *** ROS Comment till here***


    # Only "Auto" mode enabled
    async def on_channel_message(self, message):
        print(f"Received message: {message}")
        # *** ROS Comment from here***
        
        webrtc_data = json.loads(message)
        teleoperation_mode = self.check_mode(webrtc_data)
        print("Joystick is in", teleoperation_mode,  " mode!")        
        
        
        if teleoperation_mode == "MANUAL":
            try:
                # Extract the data from the received message
                # frameid_msg = webrtc_data["id"]
                timestamp_msg = rospy.Time.from_sec(webrtc_data["timestamp"])
                axes_msg = webrtc_data["axes"]
                buttons_msg = [1 if button["value"] else 0 for button in webrtc_data["buttons"]]
                joystick_data_msg = JoystickData(stamp=timestamp_msg, axes=axes_msg, buttons=buttons_msg)
                # Publish the message on the /joystick_data topic
                self.joystick_data_pub.publish(joystick_data_msg)
            
            except Exception as e:
                rospy.logwarn("WARNING processing joystick data in Manual mode: %s", str(e))

        elif teleoperation_mode == "AUTO":
            try:
                # Create a Point message
                clicked_point_msg = Point()
                clicked_point_msg.x = webrtc_data["x"] # if webrtc_data["x"] is not None else 0
                clicked_point_msg.y = webrtc_data["y"] # if webrtc_data["y"] is not None else 0
                clicked_point_msg.z = 0

                # Publish the message on the /clicked_point topic
                self.clicked_point_pub.publish(clicked_point_msg)
                
                trigger_arm_msg = Bool()
                trigger_arm_msg.data = True
                self.trigger_arm_pub.publish(trigger_arm_msg)

            except Exception as e:
                rospy.logwarn("WARNING processing joystick data in Auto mode: %s", str(e))
            
        else:
            rospy.logerr("Teleoperation Mode is not Valid ...")
        # *** ROS **
        
        # *** ROS Comment till here***



    async def handle_offer(self, data):
        
        sdp = data['sdp']
        offer = RTCSessionDescription(sdp=sdp, type='offer')
        self.offer_count += 1

        if self.offer_count == 1:
            options1 = {"framerate": data['frame1'], "video_size": data['video_size1']}
            options2 = {"framerate": data['frame2'], "video_size": data['video_size2']}
            if self.video1_path:
                self.webcam1 = MediaPlayer(self.video1_path, format="v4l2", options=options1)
            if self.video2_path:
                self.webcam2 = MediaPlayer(self.video2_path, format="v4l2", options=options2)
        print("frame1",data['frame1'],"frame2",data['frame2'],"video_size1",data['video_size1'],"video_size2",data['video_size2'],"codec1",data['codec1'],"codec2",data['codec2'],"audio_codec",data['audio_codec'])
        if self.offer_count > 1:
            print ("triggering offer count > 1 function")
            coros = [pc.close() for pc in self.pcs]
            await asyncio.gather(*coros)
            self.pcs.clear()

        pc = RTCPeerConnection()
        self.pcs.add(pc)

        if self.data_channel_required:
            self.data_channel = pc.createDataChannel('dataChannel')
            self.data_channel.on("message", self.on_channel_message)

        
        if self.webcam1:
            relay1 = MediaRelay()
            video1 = relay1.subscribe(self.webcam1.video)
            print("Adding video1")
            video1_sender = pc.addTrack(video1)
            if data['codec1']:
                self.force_codec(pc, video1_sender, data['codec1']) # Use 'self' to call instance method
            else:
                print("No Video Encoding 1")

        if self.webcam2:
            relay2 = MediaRelay()
            video2 = relay2.subscribe(self.webcam2.video)
            print("Adding video2")
            video2_sender = pc.addTrack(video2)
            if data['codec2']:
                self.force_codec(pc, video2_sender, data['codec2']) # Use 'self' to call instance method
            else:
                print("No Video Encoding 2")     

        await pc.setRemoteDescription(offer)

        answer = await pc.createAnswer()
        await pc.setLocalDescription(answer)

        # send the answer back to the WebSocket server
        answer = {"sdp": pc.localDescription.sdp, "type": pc.localDescription.type}
        await self.send_message(json.dumps(answer))

