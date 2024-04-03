#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState
import sys, select, os
if os.name == 'nt':
    import msvcrt
else:
    import tty, termios

# Terminal output prompt information
msg = """\
Arm Joint State Keyboard Controller
---------------------------
Joint control:
    1 - Joint 1
    2 - Joint 2
    3 - Joint 3
    4 - Joint 4
    5 - Joint 5
    6 - Joint 6

Other:
    q - Quit
"""

e = """
Communications Failed
"""

def getKey():
    if os.name == 'nt':
        return msvcrt.getch()

    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key

if __name__ == "__main__":
    if os.name != 'nt':
        settings = termios.tcgetattr(sys.stdin)

    rospy.init_node('arm_teleop_key')
    pub = rospy.Publisher('joint_states', JointState, queue_size=10)

    joint_names = ['joint1', 'joint2', 'joint3', 'joint4', 'joint5', 'joint6']
    joint_positions = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    try:
        print(msg)
        while not rospy.is_shutdown():
            key = getKey()
            if key == "q":
                print("Quit!")
                break
            elif key in ['1', '2', '3', '4', '5', '6']:
                joint_index = int(key) - 1
                joint_positions[joint_index] += 0.1  # Adjust the step size as desired
                joint_positions[joint_index] = max(-3.14, min(joint_positions[joint_index], 3.14))  # Limit joint position within range

                joint_state = JointState()
                joint_state.header.stamp = rospy.Time.now()
                joint_state.name = joint_names
                joint_state.position = joint_positions

                pub.publish(joint_state)

    except rospy.ROSInterruptException:
        pass

    if os.name != 'nt':
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
