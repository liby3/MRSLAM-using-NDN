cmake_minimum_required(VERSION 2.8.3)
project(ndn_ros)

## Add support for C++11, supported in ROS Kinetic and newer
# add_definitions(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  rospy
  genmsg
  message_generation
)


find_package(Boost COMPONENTS 
	thread
	filesystem
	system
	log
	log_setup
	program_options
	REQUIRED
)

## Generate messages in the 'msg' folder
add_message_files(
	FILES
	info.msg
)


generate_messages(
	DEPENDENCIES 
	std_msgs
)

catkin_package(
	INCLUDE_DIRS include
	CATKIN_DEPENDS roscpp std_msgs message_runtime
)


set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -g -std=c++0x -lm -lpthread")
INCLUDE_DIRECTORIES(/usr/include/ndn-cxx)
INCLUDE_DIRECTORIES(${catkin_INCLUDE_DIRS})
INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIRS})


add_executable(producer src/producer.cpp)
add_executable(consumer src/consumer.cpp)
add_dependencies(producer ndn_ros_generate_messages_cpp)
add_dependencies(consumer ndn_ros_generate_messages_cpp)


TARGET_LINK_LIBRARIES(producer libndn-cxx.so)
TARGET_LINK_LIBRARIES(consumer libndn-cxx.so)
TARGET_LINK_LIBRARIES(consumer ${Boost_LIBRARIES})
TARGET_LINK_LIBRARIES(producer ${catkin_LIBRARIES})
TARGET_LINK_LIBRARIES(consumer ${catkin_LIBRARIES})
