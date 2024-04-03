import sys
import os
sys.path.append(os.path.dirname(__file__))
from port_setup import setup
import time

if __name__ == "__main__":
    mc = setup()
    speed = 25

    for i in range(10):
    	
    	# --- Go to Pickup Ready
    	angles = [-20, -20, -10, -20, -10, 0]
    	while not mc.is_in_position(angles, 0):
    	    	mc.send_angles(angles, speed)
    	
    	print("*** ROBOT IS IN POSITION A-Up")
    	time.sleep(3)

    	# --- Pickup
    	angles = [-20, -30, -20, -40, -10, 0]
    	while not mc.is_in_position(angles, 0):
    	    	mc.send_angles(angles, speed)
    	
    	print("*** ROBOT IS IN POSITION A-Down")
    	time.sleep(3)
    	
    	# --- Close Gripper
    	while mc.get_gripper_value() > 25:
    		print("Gripper is closing ...", mc.get_gripper_value())
    		mc.set_gripper_state(1, 100)
    	
    	print("*** GRIPPER CLOSED")
    	time.sleep(3)


    	# --- Back to Pickup Ready
    	angles = [-20, -20, -10, -20, -10, 0]
    	while not mc.is_in_position(angles, 0):
    	    	mc.send_angles(angles, speed)
    	
    	print("*** ROBOT IS IN POSITION A-Up")
    	time.sleep(3)

        
        # --- Go to Dropoff ready   
    	angles = [40, -20, -10, -20, -10, 0]
    	while not mc.is_in_position(angles, 0):
    	    	mc.send_angles(angles, speed)
    		
    	print("*** ROBOT IS IN POSITION B-Up")
    	time.sleep(3)
    	
    	# --- Dropoff
    	angles = [40, -30, -20, -40, -10, 0]
    	while not mc.is_in_position(angles, 0):
    	    	mc.send_angles(angles, speed)
    		
    	print("*** ROBOT IS IN POSITION B-Down")
    	time.sleep(3)    	
    	
    	while mc.get_gripper_value() < 75:
    		# print("Gripper is openning ...", mc.get_gripper_value())
    		mc.set_gripper_state(0, 50)

    	print("*** GRIPPER OPENED")
    	time.sleep(3)
    	
    	# --- Back to Dropoff ready
    	angles = [40, -20, -10, -20, -10, 0]
    	while not mc.is_in_position(angles, 0):
    	    	mc.send_angles(angles, speed)
    		
    	print("*** ROBOT IS IN POSITION B-Up")
    	time.sleep(3) 

    	
