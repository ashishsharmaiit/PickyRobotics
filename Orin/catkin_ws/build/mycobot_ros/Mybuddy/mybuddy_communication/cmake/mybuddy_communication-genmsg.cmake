# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mybuddy_communication: 6 messages, 6 services")

set(MSG_I_FLAGS "-Imybuddy_communication:/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mybuddy_communication_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv" ""
)

get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv" NAME_WE)
add_custom_target(_mybuddy_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mybuddy_communication" "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)

### Generating Services
_generate_srv_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_cpp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
)

### Generating Module File
_generate_module_cpp(mybuddy_communication
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mybuddy_communication_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mybuddy_communication_generate_messages mybuddy_communication_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_cpp _mybuddy_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mybuddy_communication_gencpp)
add_dependencies(mybuddy_communication_gencpp mybuddy_communication_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mybuddy_communication_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)

### Generating Services
_generate_srv_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_eus(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
)

### Generating Module File
_generate_module_eus(mybuddy_communication
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mybuddy_communication_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mybuddy_communication_generate_messages mybuddy_communication_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_eus _mybuddy_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mybuddy_communication_geneus)
add_dependencies(mybuddy_communication_geneus mybuddy_communication_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mybuddy_communication_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)

### Generating Services
_generate_srv_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_lisp(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
)

### Generating Module File
_generate_module_lisp(mybuddy_communication
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mybuddy_communication_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mybuddy_communication_generate_messages mybuddy_communication_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_lisp _mybuddy_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mybuddy_communication_genlisp)
add_dependencies(mybuddy_communication_genlisp mybuddy_communication_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mybuddy_communication_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)

### Generating Services
_generate_srv_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_nodejs(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
)

### Generating Module File
_generate_module_nodejs(mybuddy_communication
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mybuddy_communication_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mybuddy_communication_generate_messages mybuddy_communication_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_nodejs _mybuddy_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mybuddy_communication_gennodejs)
add_dependencies(mybuddy_communication_gennodejs mybuddy_communication_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mybuddy_communication_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_msg_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)

### Generating Services
_generate_srv_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)
_generate_srv_py(mybuddy_communication
  "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
)

### Generating Module File
_generate_module_py(mybuddy_communication
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mybuddy_communication_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mybuddy_communication_generate_messages mybuddy_communication_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetAngles.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddySetCoords.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyGripperStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/msg/MybuddyPumpStatus.msg" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetAngles.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/SetCoords.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/GripperStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/orin/Orin/catkin_ws/src/mycobot_ros/Mybuddy/mybuddy_communication/srv/PumpStatus.srv" NAME_WE)
add_dependencies(mybuddy_communication_generate_messages_py _mybuddy_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mybuddy_communication_genpy)
add_dependencies(mybuddy_communication_genpy mybuddy_communication_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mybuddy_communication_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mybuddy_communication
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mybuddy_communication_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mybuddy_communication
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mybuddy_communication_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mybuddy_communication
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mybuddy_communication_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mybuddy_communication
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mybuddy_communication_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mybuddy_communication
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mybuddy_communication_generate_messages_py std_msgs_generate_messages_py)
endif()
