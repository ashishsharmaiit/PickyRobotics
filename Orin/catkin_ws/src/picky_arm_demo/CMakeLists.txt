cmake_minimum_required(VERSION 3.0.2)
project(picky_arm_demo)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  moveit_core
  moveit_ros_planning_interface
  pcl_ros
  octomap_msgs
  cv_bridge
  # moveit_visual_tools
  web_joystick_control
)

find_package(OpenCV 4 REQUIRED)  # Specify the OpenCV version (adjust the version number if needed)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)

catkin_package(
  CATKIN_DEPENDS roscpp rospy std_msgs moveit_core moveit_ros_planning_interface pcl_ros octomap_msgs cv_bridge
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)

add_executable(arm_control src/arm_control.cpp)
target_link_libraries(arm_control ${catkin_LIBRARIES})

add_executable(arm_motion_planning_moveit src/arm_motion_planning_moveit.cpp)
target_link_libraries(arm_motion_planning_moveit ${catkin_LIBRARIES})

add_executable(arm_motion_planning_collision_avoidance_moveit src/arm_motion_planning_collision_avoidance_moveit.cpp)
target_link_libraries(arm_motion_planning_collision_avoidance_moveit ${catkin_LIBRARIES} ${PCL_LIBRARIES})

add_executable(arm_motion_planning_collision_avoidance_realsense_moveit src/arm_motion_planning_collision_avoidance_realsense_moveit.cpp)
target_link_libraries(arm_motion_planning_collision_avoidance_realsense_moveit ${catkin_LIBRARIES} ${PCL_LIBRARIES})

add_executable(arm_motion_planning_collision_avoidance_realsense_clicked_moveit src/arm_motion_planning_collision_avoidance_realsense_clicked_moveit.cpp)
target_link_libraries(arm_motion_planning_collision_avoidance_realsense_clicked_moveit ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${OpenCV_LIBRARIES})
