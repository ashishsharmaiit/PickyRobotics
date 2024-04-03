import time
import os
import sys
from pymycobot.mycobot import MyCobot
from pymycobot.genre import Angle, Coord

sys.path.append(os.path.dirname(__file__))
from port_setup import setup

# reset = [153.19, 137.81, -153.54, 156.79, 87.27, 13.62]


def send_to_home(mycobot):
    angles = [0, 0, 0, 0, 0, 0]
    mycobot.send_angles(angles, 100)
    print("::send_angles() ==> angles {}, speed 100\n".format(angles))


def test(mycobot):
    print("=== Start Sending Coordinates ===\n")    
    coords = [160, 160, 160, 0, 0, 0]    
    # angles = [0, 0, 0, 0, 0, 0]
    # mycobot.send_angles(angles, 100)
    # time.sleep(3)
    # coords = mycobot.get_coords()
    # print("Robot Pose: ", coords)
    
    num_iter = 5
    for i in range(num_iter):
    	mycobot.send_coords(coords, 100, 0)
    	print("::send_coords() ==> send coords {}, speed 100, mode 0\n".format(coords))
    	time.sleep(3)        	
    	send_to_home(mycobot)
    	time.sleep(3)    
    	
    print("=== check end ===\n")
    

if __name__ == "__main__":
    mycobot = setup()
    time.sleep(1)    
    test(mycobot)
    
