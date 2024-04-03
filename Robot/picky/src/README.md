# picky_robotic_sim

This codebase includes all ROS codes of simulating robots for Picky Robotic project.

# System Installation

Ubuntu 20

ROS Noetic

Gazebo 11

MoveIt!

# Package Installation

Create a catkin workspace:

$ mkdir -p ~/catkin_ws/src

$ cd ~/catkin_ws && catkin_make

Modify the environment variables in .bashrc file:

$ echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc 

$ echo  'source /opt/ros/noetic/devel/setup.bash' >> ~/.bashrc 

Go to an arbitrary directory for instance your Desktop directory to clone the package:

$ cd ~/Desktop 

$ git clone https://github.com/amirobotic/picky_robotic_sim.git

Go to picky_robotic_sim directory on your Desktop and copy all the ROS packages inside picky_robotic_sim folder to your source folder at catkin_ws/src

$ cd ~/catkin_ws && catkin_make

$ rospack profile

# Simulation

$ roslaunch mycobot_bringup bringup_mobile_manipulator.launch sim:=true


