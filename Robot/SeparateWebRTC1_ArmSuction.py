#!/usr/bin/env python3
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


#import RPi.GPIO as GPIO
import Jetson.GPIO as GPIO

# **** ROS ****
import rospy
from port_setup import setup
from web_joystick_control.msg import JoystickData
# **** ROS **** 



speed = 50
max_speed = 100

home_joint_values = [0.0, 0.0, 0.0, 0.0, 0.0, -45]
joy_joint_values = home_joint_values
gripper_command = 0 # OPEN
# global g = gripper_command
dclose = 5
dummy_get_gripper_value = 1
ROOT = os.path.dirname(__file__)
offercount = 0
mc = setup()


pump_pin = 20
vent_pin = 21
GPIO.setmode(GPIO.BCM)
# GPIO.setmode(GPIO.BOARD)
# Either pin 20/21 can control the switch of the suction pump. Note: the switch should use the same pin Foot control
GPIO.setup(pump_pin, GPIO.OUT)
GPIO.setup(vent_pin, GPIO.OUT)



# Turn on the suction pump
def pump_on():
    # open suction pump
    GPIO.output(pump_pin, 0)

# Stop suction pump
def pump_off():
    # Shut down the suction pump
    GPIO.output(pump_pin, 1)
    # await asyncio.sleep(0.05)
    GPIO.output(vent_pin, 0)
    # await asyncio.sleep(1)
    GPIO.output(vent_pin, 1)
    # await syncio.sleep(0.05)



def send_over_data_channel(data):
    if 'data_channel' in globals() and data_channel.readyState == "open":
        data_channel.send(data)


def joy_callback(joy):
	global joy_joint_values
	global gripper_command
	increment = 5
	gripper_command = joy.buttons[0]
	joy_joint_values[0] -= joy.axes[0] * increment # J1 -> Left: counter-clockwise, Right: Clockwise 
	joy_joint_values[1] += joy.axes[1] * increment # J2
	joy_joint_values[2] += joy.axes[3] * increment # J3
	joy_joint_values[3] += joy.axes[4] * increment # J4
	if (joy.buttons[1]):
		joy_joint_values[4] += 0.5*(joy.axes[2] + 1)  * increment # J5 initial value = -1 (-1 -> +1)
		joy_joint_values[5] += 0.5*(joy.axes[5] + 1) * increment # J6  initial value = -1 (-1 -> +1)
	else:
		joy_joint_values[4] -= 0.5*(joy.axes[2] + 1)  * increment # J5 initial value = -1 (-1 -> +1)
		joy_joint_values[5] -= 0.5*(joy.axes[5] + 1) * increment # J6  initial value = -1 (-1 -> +1)	


def get_gripper_value(mc):
	while mc.get_gripper_value() < 0:
		send_over_data_channel("[ERROR] GRIPPER BAD DATA -1")
	return mc.get_gripper_value()


def create_local_tracks():
    global relay1, webcam1
    relay1 = MediaRelay()
    return None, relay1.subscribe(webcam1.video)

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
    # send_over_data_channel('Hello Back from Python!')
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
    global offercount, webcam1, data_channel
    uri = "ws://34.221.226.79:8083/"  # replace with your WebSocket server's URI
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
                    webcam1 = MediaPlayer("/dev/video0", format="v4l2", options=options1)
                    print("frame1",data['frame1'],"video_size1",data['video_size1'],"codec1",data['codec1'],"audio_codec",data['audio_codec'])
                if offercount > 1:
                        print ("triggering offer count > 1 function")
                        coros = [pc.close() for pc in pcs]
                        await asyncio.gather(*coros)
                        pcs.clear()
                sdp = data['sdp']
                offer = RTCSessionDescription(sdp=sdp, type='offer')

                pc = RTCPeerConnection()
                pcs.add(pc)

                global data_channel
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
                audio, video1 = create_local_tracks(
                    #args.play_from, decode=not args.play_without_decoding
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


async def robot_control():
	# ROS Node Initialization
	#rospy.init_node("arm_joystick_joint_node")
	#rospy.loginfo("Arm Node Initialized.")
	rate = rospy.Rate(10)
	mc.sync_send_angles(home_joint_values, speed)
	await asyncio.sleep(1)
	#mc.set_gripper_state(0, 100)
	gripper_value = 100
	await asyncio.sleep(2)
	# print("*** ROBOT IS IN HOME CONFIGURATION WITH GRIPPER OPEN***")
	send_over_data_channel("[WARNING] ROBOT IS IN HOME CONFIGURATION WITH GRIPPER OPEN")		
	# Subscribe to joystick data
	rospy.Subscriber("/joystick_data", JoystickData, joy_callback)
	
	# Control Loop
	g = 1
	while not rospy.is_shutdown():
		j = joy_joint_values
		# rospy.loginfo("Joy Joystick Value: %d, %d, %d, %d, %d, %d", j[0], j[1], j[2], j[3], j[4], j[5])
		# rospy.loginfo("Gripper command: %d", gripper_command)
		# rospy.loginfo("Gripper value: %d", gripper_value)
		send_over_data_channel("Joystick Value: J1:{}, J2{}, J3{}, J4{}, J5{}, J6{}".format(j[0], j[1], j[2], j[3], j[4], j[5]))	
		# send_over_data_channel(json.dumps("Gripper command: {}".format(gripper_command)))	
		# send_over_data_channel(json.dumps("Gripper value: {}".format(gripper_value)))	
						
		# Joint Control
		if ( (j[0] < -170) or (j[0] > +170) or (j[1] < -170) or (j[1] > +170) or (j[2] < -170) or (j[2] > +170) or (j[3] < -170) or (j[3] > +170) or (j[4] < -170) or (j[4] > +170) or (j[5] < -180) or (j[5] > +180)):
			# rospy.logerr("*** JOINT LIMIT VIOLATION ***")
			send_over_data_channel("[ERROR] JOINT LIMIT VIOLATION")				
		else:
			mc.send_angles(joy_joint_values, speed)
			# print("MOVE ROBOT")
			await asyncio.sleep(0.1)
		
		
		# Gripper Control
		if gripper_command:
			if g == 0:
				# Turn OFF suction.
				pump_off()									
				# print("Suction is OFF ...")
				# rospy.logwarn("Please wait for 3 seconds!")
				send_over_data_channel("[WARNING] SUCTION IS OFF!")
				send_over_data_channel("[WARNING] Please wait for 1 second ...")																				
				await asyncio.sleep(1)
				g = 1
			elif g == 1:
				# Turn ON suction.
				pump_on()									
				# print("Suction is ON ...")
				# rospy.logwarn("Please wait for 3 seconds!")								
				send_over_data_channel("[WARNING] SUCTION IS ON!")																
				send_over_data_channel("[WARNING] Please wait for 1 second ...")
				await asyncio.sleep(1)
				g = 0				
			else:
				continue				
		
		await asyncio.sleep(0.1)
				
		
async def main():	
    # asyncio.get_event_loop().run_until_complete(websocket_client())
    await asyncio.gather(websocket_client(), robot_control())
    #*** ROS ***
    #rospy.spin()


 
if __name__ == "__main__":
    
    # ************* ROS **********
    rospy.init_node("web_joystick_node")
    rospy.loginfo("Websocket client node initialized")
    joystick_data_pub = rospy.Publisher("/joystick_data", JoystickData, queue_size= 10)
    # ****************************
    
    asyncio.run(main())
