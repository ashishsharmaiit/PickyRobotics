#!/usr/bin/env python3
import RPi.GPIO as GPIO
from std_msgs.msg import Bool
from std_msgs.msg import String
import time
import rospy
import sys
import os
import numpy as np
from sensor_msgs.msg import JointState
from pymycobot.mycobot import MyCobot

sys.path.append(os.path.dirname(__file__))


port = "/dev/ttyTHS1"
baud = 1000000
# mc = setup()
rad2deg = 180/np.pi
deg2rad = np.pi/180
speed = 50
max_speed = 100
operation_mode = ""
home_joint_values = [0.0, 0.0, 0.0, 0.0, 0.0, -45]
joint_positions_auto = home_joint_values
joint_positions_manual = home_joint_values

gripper_command = 0  # OPEN
trigger_suction = 0
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
    time.sleep(0.05)  # 0.05
    GPIO.output(21, 0)
    time.sleep(1)
    GPIO.output(21, 1)
    time.sleep(0.05)


def joint_state_callback(data):
    # rospy.loginfo(rospy.get_caller_id() + "%s", data)
    global joint_positions_auto
    joint_positions_auto = []
    for index, value in enumerate(data.position):
        joint_positions_auto.append(value)


def joint_positions_callback(data):
    # rospy.loginfo(rospy.get_caller_id() + "%s", data)
    global joint_positions_manual
    joint_positions_manual = []
    for index, value in enumerate(data.position):
        joint_positions_manual.append(value)


def mode_callback(mode):
    global operation_mode
    operation_mode = mode.data
    # rospy.loginfo("Robot is in %s mode.", operation_mode)


def suction_callback(trigger):
    global trigger_suction
    trigger_suction = trigger.data
    # rospy.loginfo("Suction is in %s mode.", trigger_suction)


def suction_control(pub, trigger_suction, suction_mode, operation_mode):
    if operation_mode =="MANUAL":
        # Suction Control Manual
        if trigger_suction and suction_mode == "ON":
            # Turn OFF suction.
            pump_off()
            pub.publish("[WARNING] Suction is OFF ...")
            pub.publish("[WARNING] Please wait for 1 second ...")
            time.sleep(1)
            suction_mode = "OFF"
        elif trigger_suction and suction_mode == "OFF":
            # Turn ON suction.
            pump_on()
            pub.publish("[WARNING] Suction is ON!")
            pub.publish("[WARNING] Please wait for 1 second ...")
            time.sleep(1)
            suction_mode = "ON"
    
    elif operation_mode == "AUTO":
        # Suction Control AUTO
        if (not trigger_suction) and suction_mode == "ON":
            # Turn OFF suction.
            pump_off()
            pub.publish("[WARNING] Suction is OFF ...")
            pub.publish("[WARNING] Please wait for 1 second ...")
            time.sleep(1)
            suction_mode = "OFF"
        elif trigger_suction and suction_mode == "OFF":
            # Turn ON suction.
            pump_on()
            pub.publish("[WARNING] Suction is ON!")
            pub.publish("[WARNING] Please wait for 1 second ...")
            time.sleep(1)
            suction_mode = "ON"        
        
    return suction_mode    


def main():
    global mc
    # ROS Node Initialization
    rospy.init_node("arm_joystick_node")
    rospy.loginfo("Arm Node Initialized.")

    # Subscribe to operation mode
    rospy.Subscriber("/operation_mode", String, mode_callback)

    # Subscribe to operation mode
    rospy.Subscriber("/trigger_suction", Bool, suction_callback)

    # Publish terminal data
    pub = rospy.Publisher("/terminal_data", String, queue_size=10)

    # # MyCobot object
    mc = MyCobot(port, baud)

    # Joint state subscriber
    rospy.Subscriber("/joint_states", JointState, joint_state_callback)
    print("Joint state subscriber created for Auto mode.")

    # Joint positions subscriber
    rospy.Subscriber("/joint_positions", JointState, joint_positions_callback)
    print("Joint positions subscriber created for Manual mode.")

    rate = rospy.Rate(10)
    mc.sync_send_angles(home_joint_values, speed)
    time.sleep(1)
    mc.set_gripper_state(0, 100)
    gripper_value = 100

    # Initially turn off pump
    pump_off()
    pub.publish(
        "ROBOT IS IN HOME CONFIGURATION WITH PUM OFF. WAIT FOR 2 SECONDS ...")
    time.sleep(2)

    # Control Loop
    suction_mode = "OFF"
    while not rospy.is_shutdown():
        if operation_mode == "AUTO":
            # Send joint positions
            mc.send_radians(joint_positions_auto, speed)
            # Send message to webrtc application
            pub.publish("JOINT VALUES J1: {}, J2: {}, J3: {}, J4: {}, J5: {}, J6: {}".format(joint_positions_auto[0], joint_positions_auto[1], joint_positions_auto[2], joint_positions_auto[3], joint_positions_auto[4], joint_positions_auto[5]))
        elif operation_mode == "MANUAL":
            # Send joint positions
            mc.send_angles(joint_positions_manual, speed)
            # Send message to webrtc application
            pub.publish("JOINT VALUES J1: {}, J2: {}, J3: {}, J4: {}, J5: {}, J6: {}".format(joint_positions_manual[0], joint_positions_manual[1], joint_positions_manual[2], joint_positions_manual[3], joint_positions_manual[4], joint_positions_manual[5]))
        else:
            continue

        # Suction control
        suction_mode = suction_control(pub, trigger_suction, suction_mode, operation_mode)

        rate.sleep()


if __name__ == "__main__":
    main()
