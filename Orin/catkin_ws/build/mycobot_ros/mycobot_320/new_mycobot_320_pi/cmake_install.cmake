# Install script for directory: /home/orin/Orin/catkin_ws/src/mycobot_ros/mycobot_320/new_mycobot_320_pi

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/new_mycobot_320_pi.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/new_mycobot_320_pi/cmake" TYPE FILE FILES
    "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/new_mycobot_320_piConfig.cmake"
    "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/new_mycobot_320_piConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/new_mycobot_320_pi" TYPE FILE FILES "/home/orin/Orin/catkin_ws/src/mycobot_ros/mycobot_320/new_mycobot_320_pi/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_follow_display.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_slider.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_teleop_keyboard.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_listen_real.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_listen_real_of_topic.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_detect_marker.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_following_marker.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_follow_and_pump.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/new_mycobot_320_pi" TYPE PROGRAM FILES "/home/orin/Orin/catkin_ws/build/mycobot_ros/mycobot_320/new_mycobot_320_pi/catkin_generated/installspace/mycobot_320_simple_gui.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/new_mycobot_320_pi" TYPE DIRECTORY FILES "/home/orin/Orin/catkin_ws/src/mycobot_ros/mycobot_320/new_mycobot_320_pi/launch" REGEX "/setup\\_assistant\\.launch$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/new_mycobot_320_pi" TYPE DIRECTORY FILES "/home/orin/Orin/catkin_ws/src/mycobot_ros/mycobot_320/new_mycobot_320_pi/config")
endif()

