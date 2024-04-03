import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import numpy as np

class DepthFinder:
    def __init__(self):
        rospy.init_node('depth_finder')
        self.bridge = CvBridge()
        self.depth_image_sub = rospy.Subscriber('/camera/depth/image_rect_raw', Image, self.depth_image_callback)
        
    def depth_image_callback(self, msg):
        try:
            # Convert the ROS Image message to a NumPy array
            depth_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding="passthrough")
            
            # Define the pixel coordinates (x, y) you want to query
            x = 0  # Replace with your desired x-coordinate
            y = 100  # Replace with your desired y-coordinate
            
            # Get the depth value at the specified (x, y) coordinate
            depth = depth_image[x, y]  # Depth value at (x, y)

            # Print the depth value
            print(f"Depth at pixel ({x}, {y}): {depth} millimeters")

        except Exception as e:
            rospy.logerr(f"Error processing depth image: {e}")

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    depth_finder = DepthFinder()
    depth_finder.run()

