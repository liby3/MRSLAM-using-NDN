# CMake generated Testfile for 
# Source directory: /home/liby3/catkin_ws_lby/src/csm/sm
# Build directory: /home/liby3/catkin_ws_lby/build/csm/sm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(test_math_utils_sanity "test_math_utils_sanity")
SUBDIRS(lib/options)
SUBDIRS(lib/json-c)
SUBDIRS(lib/egsl)
SUBDIRS(lib/gpc)
SUBDIRS(csm)
SUBDIRS(pkg-config)
