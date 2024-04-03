#!/usr/bin/env python3
import rospy
import sys
import os
sys.path.append(os.path.dirname(__file__))
from port_setup import setup
import time
from web_joystick_control.msg import JoystickData
from std_msgs.msg import String
import RPi.GPIO as GPIO

mc = setup()
speed = 50
max_speed = 100

home_joint_values = [0.0, 0.0, 0.0, 0.0, 0.0, -45]
joy_joint_values = home_joint_values
gripper_command = 0 # OPEN
dclose = 5

# Initialize
GPIO.setmode(GPIO.BCM)
# Either pin 20/21 can control the switch of the suction pump. Note: the switch should use the same pin Foot control
GPIO.setup(20, GPIO.OUT)
GPIO.setup(21, GPIO.OUT)

# Turn on the suction pump
def pump_on():
    # open suction pump
    GPIO.output(20, 0)

# Stop suction pump
def pump_off():
    # Shut down the suction pump
    GPIO.output(20, 1)
    time.sleep(0.05) # 0.05
    GPIO.output(21, 0)
    time.sleep(1)
    GPIO.output(21, 1)
    time.sleep(0.05)


# Added this function to stream terminal data.
def send_over_data_channel(data):
    if data_channel and data_channel.readyState == "open":
        data_channel.send(json.dumps(data))
        

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
	

def get_gripper_value(mc, pub):
	while mc.get_gripper_value() < 0:
		pub.publish("Gripper Is Sending Bad Data (-1)")
		
	return mc.get_gripper_value()

def main():	
	# ROS Node Initialization
	rospy.init_node("arm_joystick_node")
	rospy.loginfo("Arm Node Initialized.")
	
	# Subscribe to joystick data
	rospy.Subscriber("/joystick_data", JoystickData, joy_callback)
	
	# Publish terminal data
	pub = rospy.Publisher("/terminal_data", String, queue_size=10)

	rate = rospy.Rate(10)
	mc.sync_send_angles(home_joint_values, speed)
	time.sleep(1)
	mc.set_gripper_state(0, 100)
	gripper_value = 100
	# Initially turn off pump
	pump_off()	
	pub.publish("ROBOT IS IN HOME CONFIGURATION WITH PUM OFF. WAIT FOR 3 SECONDS ...")
	time.sleep(3)

	# Control Loop
	g = 0
	while not rospy.is_shutdown():
		j = joy_joint_values
		pub.publish("JOINT VALUES J1: {}, J2: {}, J3: {}, J4: {}, J5: {}, J6: {}".format(j[0],j[1],j[2],j[3],j[4],j[5]))
		pub.publish("Gripper Command: {}".format(gripper_command))
		pub.publish("Gripper Value: {}".format(gripper_value))	
		
		# Joint Control
		if ( (j[0] < -170) or (j[0] > +170) or (j[1] < -170) or (j[1] > +170) or (j[2] < -170) or (j[2] > +170) or (j[3] < -170) or (j[3] > +170) or (j[4] < -170) or (j[4] > +170) or (j[5] < -180) or (j[5] > +180)):
			pub.publish("[ERROR] JOINT LIMIT VIOLATION J1: {}, J2: {}, J3: {}, J4: {}, J5: {}, J6: {}".format(j[0],j[1],j[2],j[3],j[4],j[5]))
		else:
			mc.send_angles(joy_joint_values, speed)
			pub.publish()			
			time.sleep(0.1)
		
		
		# Gripper Control
		if gripper_command:
			if g == 0:
				# Turn OFF suction.
				pump_off()									
				pub.publish("[WARNING] Suction is OFF ...")
				pub.publish("[WARNING] Please wait for 1 second ...")				
				time.sleep(1)
				g = 1
			elif g == 1:
				# Turn ON suction.
				pump_on()									
				pub.publish("[WARNING] Suction is ON!")
				pub.publish("[WARNING] Please wait for 1 second ...")
				time.sleep(1)
				g = 0				
			else:
				continue				
		
		rate.sleep()


 
if __name__ == "__main__":
	main()
 	
