#!/usr/bin/env python3
import rospy
import sys
import os
sys.path.append(os.path.dirname(__file__))
from port_setup import setup
import time
from web_joystick_control.msg import JoystickData

mc = setup()
speed = 50
max_speed = 100

home_joint_values = [0.0, 0.0, 0.0, 0.0, 0.0, -45]
joy_joint_values = home_joint_values
gripper_value = 0 # OPEN
# global g = gripper_value


def joy_callback(joy):
	global joy_joint_values
	global gripper_value
	increment = 5
	gripper_value = joy.buttons[0]
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
	

def main():
	# ROS Node Initialization
	rospy.init_node("arm_joystick_joint_node")
	rospy.loginfo("Arm Node Initialized.")
	rate = rospy.Rate(10)
	mc.sync_send_angles(home_joint_values, speed)
	time.sleep(1)
	mc.set_gripper_state(0, 100)
	time.sleep(3)
	print("*** ROBOT IS IN HOME CONFIGURATION WITH GRIPPER OPEN***")
							
	# Subscribe to joystick data
	rospy.Subscriber("/joystick_data", JoystickData, joy_callback)
	
	# Control Loop
	g = 0
	while not rospy.is_shutdown():
		j = joy_joint_values
		# TODO: Avoid -1 value!
		# g = mc.get_gripper_value() 
			
		rospy.loginfo("Joy Joystick Value: %d, %d, %d, %d, %d, %d", j[0], j[1], j[2], j[3], j[4], j[5])
		rospy.loginfo("Gripper: %d", gripper_value)
		
		# Joint Control
		if ( (j[0] < -170) or (j[0] > +170) or (j[1] < -170) or (j[1] > +170) or (j[2] < -170) or (j[2] > +170) or (j[3] < -170) or (j[3] > +170) or (j[4] < -170) or (j[4] > +170) or (j[5] < -180) or (j[5] > +180)):
			rospy.logerr("*** JOINT LIMIT VIOLATION ***")
		else:
			mc.send_angles(joy_joint_values, speed)
			print("MOVE ROBOT")
			time.sleep(0.1)
		
		
		# Gripper Control
		if gripper_value:
			if g == 0:
				# Close Gripper
				while mc.get_gripper_value() > 25:
					mc.set_gripper_state(1, 100)
					print("CLOSING GRIPPER ...")					
				g = 1
				time.sleep(2)
			elif g == 1:
				# Open Gripper
				while mc.get_gripper_value() < 75:
					mc.set_gripper_state(0, 100)
					print("OPENING GRIPPER ...")
				g = 0				
				time.sleep(2)
			else:
				continue				
		
		rate.sleep()


 
if __name__ == "__main__":
	main()
 	
