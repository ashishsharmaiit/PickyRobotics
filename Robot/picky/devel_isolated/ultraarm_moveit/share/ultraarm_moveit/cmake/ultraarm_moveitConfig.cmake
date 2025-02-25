# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(ultraarm_moveit_CONFIG_INCLUDED)
  return()
endif()
set(ultraarm_moveit_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(ultraarm_moveit_SOURCE_PREFIX /home/jetson/picky/src/mycobot_ros/ultraArm/ultraarm_moveit)
  set(ultraarm_moveit_DEVEL_PREFIX /home/jetson/picky/devel_isolated/ultraarm_moveit)
  set(ultraarm_moveit_INSTALL_PREFIX "")
  set(ultraarm_moveit_PREFIX ${ultraarm_moveit_DEVEL_PREFIX})
else()
  set(ultraarm_moveit_SOURCE_PREFIX "")
  set(ultraarm_moveit_DEVEL_PREFIX "")
  set(ultraarm_moveit_INSTALL_PREFIX /home/jetson/picky/install_isolated)
  set(ultraarm_moveit_PREFIX ${ultraarm_moveit_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'ultraarm_moveit' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(ultraarm_moveit_FOUND_CATKIN_PROJECT TRUE)

if(NOT " " STREQUAL " ")
  set(ultraarm_moveit_INCLUDE_DIRS "")
  set(_include_dirs "")
  if(NOT "https://github.com/ros-planning/moveit/issues " STREQUAL " ")
    set(_report "Check the issue tracker 'https://github.com/ros-planning/moveit/issues' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://moveit.ros.org/ " STREQUAL " ")
    set(_report "Check the website 'http://moveit.ros.org/' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'weijian.wang <weijian.wang@elephanticrobots.com>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${ultraarm_moveit_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'ultraarm_moveit' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'ultraarm_moveit' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/jetson/picky/src/mycobot_ros/ultraArm/ultraarm_moveit/${idir}'.  ${_report}")
    endif()
    _list_append_unique(ultraarm_moveit_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND ultraarm_moveit_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND ultraarm_moveit_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT ultraarm_moveit_NUM_DUMMY_TARGETS)
      set(ultraarm_moveit_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::ultraarm_moveit::wrapped-linker-option${ultraarm_moveit_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR ultraarm_moveit_NUM_DUMMY_TARGETS "${ultraarm_moveit_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::ultraarm_moveit::wrapped-linker-option${ultraarm_moveit_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND ultraarm_moveit_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND ultraarm_moveit_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND ultraarm_moveit_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/jetson/picky/devel_isolated/ultraarm_moveit/lib;/home/jetson/picky/devel_isolated/ultraarm/lib;/home/jetson/picky/devel_isolated/ultraarm_communication/lib;/home/jetson/picky/devel_isolated/teleop_twist_keyboard/lib;/home/jetson/picky/devel_isolated/robotis_controller/lib;/home/jetson/picky/devel_isolated/robotis_framework_common/lib;/home/jetson/picky/devel_isolated/robotis_framework/lib;/home/jetson/picky/devel_isolated/robotis_device/lib;/home/jetson/picky/devel_isolated/robotis_controller_msgs/lib;/home/jetson/picky/devel_isolated/picky_arm_demo/lib;/home/jetson/picky/devel_isolated/new_mycobot_320_pi_moveit/lib;/home/jetson/picky/devel_isolated/new_mycobot_320_pi/lib;/home/jetson/picky/devel_isolated/new_mycobot_320_moveit/lib;/home/jetson/picky/devel_isolated/new_mycobot_320_gripper_moveit/lib;/home/jetson/picky/devel_isolated/new_mycobot_320/lib;/home/jetson/picky/devel_isolated/mypalletizer_260_pi/lib;/home/jetson/picky/devel_isolated/mypalletizer_260/lib;/home/jetson/picky/devel_isolated/mypalletizer_communication/lib;/home/jetson/picky/devel_isolated/mypalletizer_260_pi_moveit/lib;/home/jetson/picky/devel_isolated/mypalletizer_260_moveit/lib;/home/jetson/picky/devel_isolated/mycobot_moveit_config/lib;/home/jetson/picky/devel_isolated/mycobot_move_it_config/lib;/home/jetson/picky/devel_isolated/mycobot_gazebo/lib;/home/jetson/picky/devel_isolated/mycobot_600_moveit/lib;/home/jetson/picky/devel_isolated/mycobot_600/lib;/home/jetson/picky/devel_isolated/mycobot_320_moveit/lib;/home/jetson/picky/devel_isolated/mycobot_320/lib;/home/jetson/picky/devel_isolated/mycobot_280pi_moveit/lib;/home/jetson/picky/devel_isolated/mycobot_280pi/lib;/home/jetson/picky/devel_isolated/mycobot_280jn_moveit/lib;/home/jetson/picky/devel_isolated/mycobot_280jn/lib;/home/jetson/picky/devel_isolated/mycobot_280arduino_moveit/lib;/home/jetson/picky/devel_isolated/mycobot_280arduino/lib;/home/jetson/picky/devel_isolated/mycobot_280_moveit/lib;/home/jetson/picky/devel_isolated/mycobot_280/lib;/home/jetson/picky/devel_isolated/mybuddy_socket/lib;/home/jetson/picky/devel_isolated/mybuddy/lib;/home/jetson/picky/devel_isolated/mybuddy_communication/lib;/home/jetson/picky/devel_isolated/mecharm_pi_moveit/lib;/home/jetson/picky/devel_isolated/mecharm_pi/lib;/home/jetson/picky/devel_isolated/mecharm_moveit/lib;/home/jetson/picky/devel_isolated/mecharm/lib;/home/jetson/picky/devel_isolated/mecharm_communication/lib;/home/jetson/picky/devel_isolated/mycobot_description/lib;/home/jetson/picky/devel_isolated/mycobot_control/lib;/home/jetson/picky/devel_isolated/mycobot_communication/lib;/home/jetson/picky/devel_isolated/mycobot_bringup/lib;/home/jetson/picky/devel_isolated/mycobot_320_gripper_moveit/lib;/home/jetson/picky/devel_isolated/mycobot_320_communication/lib;/home/jetson/picky/devel_isolated/mybuddy_socket_moveit/lib;/home/jetson/picky/devel_isolated/mybuddy_moveit/lib;/home/jetson/picky/devel_isolated/myagv_urdf/lib;/home/jetson/picky/devel_isolated/myagv_teleop/lib;/home/jetson/picky/devel_isolated/myagv_ps2/lib;/home/jetson/picky/devel_isolated/myagv_odometry/lib;/home/jetson/picky/devel_isolated/myagv_navigation/lib;/home/jetson/picky/devel_isolated/learning_joy/lib;/home/jetson/picky/devel_isolated/husky_ur3_navigation/lib;/home/jetson/picky/devel_isolated/husky_ur3_nav_without_map/lib;/home/jetson/picky/devel_isolated/husky_ur3_gripper_moveit_config/lib;/home/jetson/picky/devel_isolated/husky_ur3_gazebo/lib;/home/jetson/picky/devel_isolated/gazebo_ros_link_attacher/lib;/home/jetson/picky/devel_isolated/dynamixel_sdk_examples/lib;/home/jetson/picky/devel_isolated/dynamixel_sdk/lib;/home/jetson/picky/devel_isolated/aws_robomaker_small_warehouse_world/lib;/home/jetson/catkin_ws/devel/lib;/opt/ros/noetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(ultraarm_moveit_LIBRARY_DIRS ${lib_path})
      list(APPEND ultraarm_moveit_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'ultraarm_moveit'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND ultraarm_moveit_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(ultraarm_moveit_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${ultraarm_moveit_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 ultraarm_moveit_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${ultraarm_moveit_dep}_FOUND)
      find_package(${ultraarm_moveit_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${ultraarm_moveit_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(ultraarm_moveit_INCLUDE_DIRS ${${ultraarm_moveit_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(ultraarm_moveit_LIBRARIES ${ultraarm_moveit_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${ultraarm_moveit_dep}_LIBRARIES})
  _list_append_deduplicate(ultraarm_moveit_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(ultraarm_moveit_LIBRARIES ${ultraarm_moveit_LIBRARIES})

  _list_append_unique(ultraarm_moveit_LIBRARY_DIRS ${${ultraarm_moveit_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(ultraarm_moveit_EXPORTED_TARGETS ${${ultraarm_moveit_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${ultraarm_moveit_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
