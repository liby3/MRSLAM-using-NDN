# Install script for directory: /home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/liby3/catkin_ws_lby/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/json-c" TYPE FILE FILES
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/json_object_private.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/json_util.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/json_more_utils.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/json_tokener.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/linkhash.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/JSON_checker.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/arraylist.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/json.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/printbuf.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/bits.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/json_object.h"
    "/home/liby3/catkin_ws_lby/src/csm/sm/lib/json-c/debug.h"
    "/home/liby3/catkin_ws_lby/build/config.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

