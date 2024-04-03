# PickyRobotics

Picky Robotics was a side project to partially automate and partially tele-operate a robotic arm mounted on top of an AGV (Automated Guided Vehicle) to restock products in retail store on the shelves, and pick up products for e-commerce orders. The final output of the project can be seen in this video:

video link

The hardware used was Elephant Robotics AGV ([link](https://shop.elephantrobotics.com/collections/myagv)) and robotic arm ([link](https://shop.elephantrobotics.com/collections/mycobot)), along with Jetson Nano Orin board ([link](https://www.amazon.com/NVIDIA-Jetson-Orin-Nano-Developer/dp/B0BZJTQ5YP/ref=sr_1_4?crid=1KP7XUWV8W7WZ&dib=eyJ2IjoiMSJ9.9gCJw-kXE2J0rq1kTcqrwYIhb5V7beyBCAk4wMXTUW9Zug1aUlJlaKTkdkvf8S7uQ6riSXjcjIfHfBsseUSDotSDtK2J1jWxXs5fRpx9ajH6zMzFYfC7a2HdnigutUF3wYWuKAmASwopZ0FKc_W_P0xibj5SfJlRTWuHWAzK38oLX_ggjelnsTNbKxJ6UsbDVWFRq8BmGrYGxi20vIwTl6BTFHJ37eNlTWA_pa0fU00.BwD27H1P5UsZRFRmx4vRvGhGJVJB003J-ObuOx5QjdM&dib_tag=se&keywords=jetson+orin&qid=1712116785&sprefix=jetson+%2Caps%2C774&sr=8-4)) and Intel Realsense 3D Camera (https://www.amazon.com/Intel-Realsense-D435-Webcam-FPS/dp/B07BLS5477/ref=sr_1_1?crid=FYSV9ICHGYL5&dib=eyJ2IjoiMSJ9.kF-s8KCp4ID2xKAxTR4XwTzH1C5zC5yspINkKqhdm_aEtCXm3IwWUO1egnHTtAawlzZL7vNXJl3oNF5bmSjrO9ku5UDKbJUTpZ1sZFsC3PE.VryyQBjHpB2EZhZMx5miYgOeBMpqKfj-y90Uf7n6i8c&dib_tag=se&keywords=intel+realsense+d435&qid=1712117089&sprefix=intel+realsense+d435%2Caps%2C187&sr=8-1). 

The code was divided into:
1. Operator code to tele-operate the robot. It was coded on Javascript (operator side) and Python (robot side).
2. Robot code to operate the AGV and the robotic arm. It was coded in ROS and Python.
3. Orin code to get 3D camera feed from the robot, and accordingly automatically plan the path for the robotic arm according to the depth of the object identified by tele-operator to pick up. It was coded in ROS and python.

The three folders in the repository contains the respective code.
