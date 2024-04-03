cmake_minimum_required(VERSION 2.8.3)
project(learning_joy)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  joy
  roscpp
  turtlesim
  sensor_msgs
  std_msgs
  moveit_core
  moveit_ros_planning
  moveit_ros_planning_interface
  web_joystick_control  
)

# find_package(Boost REQUIRED)
# find_package(OpenSSL REQUIRED)
# find_package(WebSocketPP REQUIRED)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)

################################################
## Declare ROS messages, services and actions ##
################################################

## To declare and build messages, services, or actions from within this
## package, follow these steps:
## * Let MSG_DEP_SET be the set of packages whose message types you use in
##   your messages/services/actions (e.g. std_msgs, actionlib_msgs, ...).
## * In the file package.xml:
##   * add a build_depend tag for "message_generation"
##   * add a build_depend and a run_depend tag for each package in MSG_DEP_SET
##   * If MSG_DEP_SET isn't empty, the following dependency has been pulled in
##     but can be declared for certainty nonetheless:
##     * add a run_depend tag for "message_runtime"
## * In this file (CMakeLists.txt):
##   * add "message_generation" and every package in MSG_DEP_SET to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * add "message_runtime" and every package in MSG_DEP_SET to
##     catkin_package(CATKIN_DEPENDS ...)
##   * uncomment the add_*_files sections below as needed
##     and list every .msg/.srv/.action file to be processed
##   * uncomment the generate_messages entry below
##   * add every package in MSG_DEP_SET to generate_messages(DEPENDENCIES ...)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
# generate_messages(
#   DEPENDENCIES
#   std_msgs  # Or other packages containing msgs
# )

################################################
## Declare ROS dynamic reconfigure parameters ##
################################################

## To declare and build dynamic reconfigure parameters within this
## package, follow these steps:
## * In the file package.xml:
##   * add a build_depend and a run_depend tag for "dynamic_reconfigure"
## * In this file (CMakeLists.txt):
##   * add "dynamic_reconfigure" to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * uncomment the "generate_dynamic_reconfigure_options" section below
##     and list every .cfg file to be processed

## Generate dynamic reconfigure parameters in the 'cfg' folder
# generate_dynamic_reconfigure_options(
#   cfg/DynReconf1.cfg
#   cfg/DynReconf2.cfg
# )

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES learning_joy
  CATKIN_DEPENDS joy roscpp turtlesim sensor_msgs std_msgs moveit_core moveit_ros_planning moveit_ros_planning_interface web_joystick_control
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

# include_directories(
#     ${Boost_INCLUDE_DIRS}
#     ${OPENSSL_INCLUDE_DIR}
# )
# include_directories(${WebSocketPP_INCLUDE_DIRS})

## Declare a C++ executable
add_executable(teleop_turtle_joy src/teleop_turtle_joy.cpp)
add_executable(base_joystick src/base_joystick.cpp)
add_executable(arm_joystick_cartesian src/arm_joystick_cartesian.cpp)
add_executable(arm_joystick_joint src/arm_joystick_joint.cpp)
add_executable(gripper_joystick src/gripper_joystick.cpp)
# add_executable(web_base_joystick src/web_base_joystick.cpp)
# add_executable(web_arm_joystick_cartesian src/web_arm_joystick_cartesian.cpp)
# add_executable(web_arm_joystick_joint src/web_arm_joystick_joint.cpp)
# add_executable(web_gripper_joystick src/web_gripper_joystick.cpp)


## Add cmake target dependencies of the executable
## same as for the library above
# add_dependencies(learning_joy_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
target_link_libraries(teleop_turtle_joy 
  ${catkin_LIBRARIES}
)
target_link_libraries(base_joystick 
  ${catkin_LIBRARIES}
)
target_link_libraries(arm_joystick_cartesian
  ${catkin_LIBRARIES}
)
target_link_libraries(arm_joystick_joint 
  ${catkin_LIBRARIES}
)
target_link_libraries(gripper_joystick 
  ${catkin_LIBRARIES}
)
# target_link_libraries(web_base_joystick 
#   ${catkin_LIBRARIES}
# )
# target_link_libraries(web_arm_joystick_cartesian
#   ${catkin_LIBRARIES}
# )
# target_link_libraries(web_arm_joystick_joint 
#   ${catkin_LIBRARIES}
# )
# target_link_libraries(web_gripper_joystick 
#   ${catkin_LIBRARIES}
# )
# target_link_libraries(web_gripper_joystick
#     ${Boost_LIBRARIES}
#     ${OPENSSL_LIBRARIES}
#     ${WebSocketPP_LIBRARIES}
# )

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS learning_joy learning_joy_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest-based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_learning_joy.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)

