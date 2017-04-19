# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ndn_ros: 1 messages, 0 services")

set(MSG_I_FLAGS "-Indn_ros:/home/liby3/catkin_ws_lby/src/ndn_ros/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ndn_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/liby3/catkin_ws_lby/src/ndn_ros/msg/info.msg" NAME_WE)
add_custom_target(_ndn_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndn_ros" "/home/liby3/catkin_ws_lby/src/ndn_ros/msg/info.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ndn_ros
  "/home/liby3/catkin_ws_lby/src/ndn_ros/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndn_ros
)

### Generating Services

### Generating Module File
_generate_module_cpp(ndn_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndn_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ndn_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ndn_ros_generate_messages ndn_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liby3/catkin_ws_lby/src/ndn_ros/msg/info.msg" NAME_WE)
add_dependencies(ndn_ros_generate_messages_cpp _ndn_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ndn_ros_gencpp)
add_dependencies(ndn_ros_gencpp ndn_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ndn_ros_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ndn_ros
  "/home/liby3/catkin_ws_lby/src/ndn_ros/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndn_ros
)

### Generating Services

### Generating Module File
_generate_module_lisp(ndn_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndn_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ndn_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ndn_ros_generate_messages ndn_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liby3/catkin_ws_lby/src/ndn_ros/msg/info.msg" NAME_WE)
add_dependencies(ndn_ros_generate_messages_lisp _ndn_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ndn_ros_genlisp)
add_dependencies(ndn_ros_genlisp ndn_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ndn_ros_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ndn_ros
  "/home/liby3/catkin_ws_lby/src/ndn_ros/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndn_ros
)

### Generating Services

### Generating Module File
_generate_module_py(ndn_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndn_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ndn_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ndn_ros_generate_messages ndn_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liby3/catkin_ws_lby/src/ndn_ros/msg/info.msg" NAME_WE)
add_dependencies(ndn_ros_generate_messages_py _ndn_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ndn_ros_genpy)
add_dependencies(ndn_ros_genpy ndn_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ndn_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndn_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndn_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ndn_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndn_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndn_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ndn_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndn_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndn_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndn_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ndn_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
