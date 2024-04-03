#!/usr/bin/env python3

import rospy
from std_msgs.msg import Float64
import sys, select, os
if os.name == 'nt':
  import msvcrt
else:
  import tty, termios

# Terminal output prompt information. 终端输出提示信息
msg = """\
Gripper Teleop Keyboard Controller
---------------------------
Gripper control:
    g - open
    h - close

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

def vels(target_linear_vel, target_angular_vel):
    return "currently:\tlinear vel %s\t angular vel %s " % (target_linear_vel, target_angular_vel)

def makeSimpleProfile(output, input, slop):
    if input > output:
        output = min( input, output + slop )
    elif input < output:
        output = max( input, output - slop )
    else:
        output = input

    return output

def constrain(input, low, high):
    if input < low:
      input = low
    elif input > high:
      input = high
    else:
      input = input

    return input

def checkLinearLimitVelocity(vel):
    vel = constrain(vel, -ROBOT_MAX_LIN_VEL, ROBOT_MAX_LIN_VEL)
    return vel

def checkAngularLimitVelocity(vel):
    vel = constrain(vel, -ROBOT_MAX_ANG_VEL, ROBOT_MAX_ANG_VEL)
    return vel

if __name__=="__main__":
    if os.name != 'nt':
        settings = termios.tcgetattr(sys.stdin)

    rospy.init_node('gripper_teleop')
    pub = rospy.Publisher('rh_p12_rn_position/command', Float64, queue_size=10)

    try:
        print(msg)
        while(1):
            gripper_command = Float64()
            key = getKey()
            if key == "q":
                print("Quit!")
                break
            elif key == 'g' :
                print("Open gripper")
                gripper_command.data = 0.0
                pub.publish(gripper_command)
            elif key == 'h' :
                print("Close gripper")
                gripper_command.data = 1.0
                pub.publish(gripper_command)

    except:
        print(e)

    if os.name != 'nt':
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
