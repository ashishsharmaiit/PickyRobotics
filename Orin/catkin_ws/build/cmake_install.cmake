# Install script for directory: /home/orin/Orin/catkin_ws/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/orin/Orin/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orin/Orin/catkin_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/orin/Orin/catkin_ws/install" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orin/Orin/catkin_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/orin/Orin/catkin_ws/install" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orin/Orin/catkin_ws/install/setup.bash;/home/orin/Orin/catkin_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/orin/Orin/catkin_ws/install" TYPE FILE FILES
    "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/setup.bash"
    "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orin/Orin/catkin_ws/install/setup.sh;/home/orin/Orin/catkin_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/orin/Orin/catkin_ws/install" TYPE FILE FILES
    "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/setup.sh"
    "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orin/Orin/catkin_ws/install/setup.zsh;/home/orin/Orin/catkin_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/orin/Orin/catkin_ws/install" TYPE FILE FILES
    "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/setup.zsh"
    "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/orin/Orin/catkin_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/orin/Orin/catkin_ws/install" TYPE FILE FILES "/home/orin/Orin/catkin_ws/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/orin/Orin/catkin_ws/build/gtest/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/Mybuddy/mybuddy_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/Mybuddy/mybuddy_socket_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/mycobot_320_gripper_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_bringup/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_description/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/mycobot_320_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_pro/mycobot_600/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_gazebo/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_move_it_config/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_moveit_config/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_gripper_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/realsense-ros/realsense2_description/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/ultraArm/ultraarm_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/geometric_shapes/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/myagv_teleop/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/mycobot_320_communication/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_communication/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_picky/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/ddynamic_reconfigure/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mecharm/mecharm_communication/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/Mybuddy/mybuddy_communication/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_280/mycobot_280/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_280/mycobot_280arduino/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_280/mycobot_280jn/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_280/mycobot_280pi/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/mycobot_320/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_real_robot/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mypalletizer_260/mypalletizer_communication/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_control/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mecharm/mecharm_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mecharm/mecharm_pi_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_280/mycobot_280_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_280/mycobot_280arduino_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_280/mycobot_280jn_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_280/mycobot_280pi_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_pro/mycobot_600_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mypalletizer_260/mypalletizer_260_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mypalletizer_260/mypalletizer_260_pi_moveit/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/rgbd_launch/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/myagv_navigation/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/myagv_odometry/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/myagv_ps2/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/myagv_urdf/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/realsense-ros/realsense2_camera/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/ultraArm/ultraarm_communication/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/srdfdom/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/web_joystick_control/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/picky_arm_demo/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mecharm/mecharm/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mecharm/mecharm_pi/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/Mybuddy/mybuddy/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/Mybuddy/mybuddy_socket/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mypalletizer_260/mypalletizer_260/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/mypalletizer_260/mypalletizer_260_pi/cmake_install.cmake")
  include("/home/orin/Orin/catkin_ws/build/mycobot_ros/ultraArm/ultraarm/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/orin/Orin/catkin_ws/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
