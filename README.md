# ROSProjet
smart car using ROS system, udp and ndn
# ROSProject
This project is a multi-robot slam under ROS Indigo, with the environment ubuntu 14.04 LTS. There are two lasers UTM-30LX-EW to scan. The two cars start from the same place and seperate at the fork. They can communicate and match what they have scaned from the start. After the fork, the two cars continue to transform new data on the way and struct a complete map with each other's information. A related paper can be found [here.](http://ieeexplore.ieee.org/abstract/document/6696483/)

![car](https://github.com/liby3/ROSProjet/blob/mrslam/photos/car.jpg)

# 1.	Environment
The machine we used must be Ubuntu 14.04 LTS, with a RAM more than 4GB. Then we can install ROS Indigo on it.

![laser](https://github.com/liby3/ROSProjet/blob/mrslam/photos/laser.jpg)

## 1.1.	ROS Indigo Basic Installation

### 1.1.1.	Configure your Ubuntu repositories
Configure your Ubuntu repositories to allow "restricted," "universe," and "multiverse."

###	1.1.2.	Setup your sources.list

	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

### 1.1.3.	Set up your keys

	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

or

	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

###	1.1.4.	Installation

	sudo apt-get update

	sudo apt-get install ros-indigo-desktop-full

	sudo apt-get install python-rosinstall

To find usage ros package:

	apt-cache search ros-indigo

###	1.1.5.	Initialize rosdep

	sudo rosdep init

	rosdep update

###	1.1.6.	Environment setup

	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	source ~/.bashrc

## 1.2.	Project environment requires

	mkdir -p ~/catkin_ws_test/src

	cd ~/catkin_ws/

You can find a folder named "src", after make, you will find another two folders named devel and build. You should put all the coding files under src.

	git clone https://github.com/liby3/ROSProjet.git

	sudo apt-get install ros-indigo-csm

	sudo apt-get install libsuitesparse-dev

	sudo apt-get install freeglut3-dev

## 1.3.	Make

	cd catkin_ws_test

	catkin_make


# 2.	Start project
-	Open terminal 1:

		cd catkin_ws_test
	
		source devel/setup.sh

		roslaunch laser_scan_matcher demo.launch

-	Open terminal 2:

		cd catkin_ws_test

		source devel/setup.sh

		rosrun odom_tf_package odom_tf_node

-	Open terminal 3:

		cd catkin_ws_test

		source devel/setup.sh

		rosrun cg_mrslam real_mrslam -idRobot 0 -nRobots 2 -odometryTopic /car_1_odom -scanTopic /car_2_scan -fixedFrame /odom -o map-01-test.g2o __ns:=robot_0 >> map-01-test.log

-	Open terminal 4:

		# cd the dirctory stores data
		cd catkin_ws_test/bagfiles

		source devel/setup.sh

		rosbag play 2017-test.bag --clock


-	Open terminal 5:

		cd catkin_ws_test/

		source devel/setup.sh

		# check current map structure

		rosrun rviz rviz

		# draw map and output in .png

		rosrun g2oros g2oros map-01-test.g2o map-01-test
