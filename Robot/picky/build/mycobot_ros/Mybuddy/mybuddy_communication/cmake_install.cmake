# Install script for directory: /home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jetson/Robot/picky/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mybuddy_communication/msg" TYPE FILE FILES
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mybuddy_communication/srv" TYPE FILE FILES
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv"
    "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mybuddy_communication/cmake" TYPE FILE FILES "/home/jetson/Robot/picky/build/mycobot_ros/Mybuddy/mybuddy_communication/catkin_generated/installspace/mybuddy_communication-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/jetson/Robot/picky/devel/include/mybuddy_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/jetson/Robot/picky/devel/share/roseus/ros/mybuddy_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/jetson/Robot/picky/devel/share/common-lisp/ros/mybuddy_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/jetson/Robot/picky/devel/share/gennodejs/ros/mybuddy_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/jetson/Robot/picky/devel/lib/python3/dist-packages/mybuddy_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/jetson/Robot/picky/devel/lib/python3/dist-packages/mybuddy_communication")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jetson/Robot/picky/build/mycobot_ros/Mybuddy/mybuddy_communication/catkin_generated/installspace/mybuddy_communication.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mybuddy_communication/cmake" TYPE FILE FILES "/home/jetson/Robot/picky/build/mycobot_ros/Mybuddy/mybuddy_communication/catkin_generated/installspace/mybuddy_communication-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mybuddy_communication/cmake" TYPE FILE FILES
    "/home/jetson/Robot/picky/build/mycobot_ros/Mybuddy/mybuddy_communication/catkin_generated/installspace/mybuddy_communicationConfig.cmake"
    "/home/jetson/Robot/picky/build/mycobot_ros/Mybuddy/mybuddy_communication/catkin_generated/installspace/mybuddy_communicationConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mybuddy_communication" TYPE FILE FILES "/home/jetson/Robot/picky/src/mycobot_ros/Mybuddy/mybuddy_communication/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/mybuddy_communication" TYPE PROGRAM FILES "/home/jetson/Robot/picky/build/mycobot_ros/Mybuddy/mybuddy_communication/catkin_generated/installspace/mybuddy_services.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/mybuddy_communication" TYPE PROGRAM FILES "/home/jetson/Robot/picky/build/mycobot_ros/Mybuddy/mybuddy_communication/catkin_generated/installspace/mybuddy_topics.py")
endif()

