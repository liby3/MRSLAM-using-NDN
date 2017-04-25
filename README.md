# ROSProjet

mrslam分支
## 1.	分支

分为mrslam和ndn分支。

## 1.1.	综述

mrslam是基于多车建图的基本代码，在ubuntu14.04LTS下配置ROS环境并且已经跑通，可以两车在离线的环境下协同建图。参考论文是[Multi-robot SLAM using condensed measurements](http://ieeexplore.ieee.org/abstract/document/6696483/)

![car](https://github.com/liby3/ROSProjet/blob/mrslam/photos/car.jpg)


## 1.2.	配置

需要配置G2O，NDN，NFD等一系列库。

##	2.	用法

-	开启NFD，nfdc注册对方的IP和传输策略

	
	sudo nfd-start 

	sudo nfdc register ndn:/example udp://10.0.0.X
	
	sudo nfdc set-strategy ndn:/example /localhost/nfd/strategy/multicast 



-	开启节点间message通信服务器


	roslaunch laser_scan_matcher demo.launch

-	开启Pose数据转换为里程计


	rosrun odom_tf_package odom_tf_node

-	开启主程序


	rosrun cg_mrslam real_mrslam -idRobot 0 -nRobots 2 -odometryTopic /car_1_odom -scanTopic /car_2_scan -fixedFrame /odom -o map-01.g2o __ns:=robot_0

-	开启producer节点，接收来自主程序持续发来的最新本地data，供其他robot发来interest时，回复使用


	rosrun ndn_ros producer ndn:/example

-	开启consumer节点，接收来自主程序间隔发来的interest，发送出去，并将收到的data返回给主程序

	
	rosrun ndn_ros consumer

-	回放采集好的数据包，开始整个过程：


	rosbag play XXX.bag --clock


![laser](https://github.com/liby3/ROSProjet/blob/mrslam/photos/laser.jpg)


##	3.	节点间通信图

![node](https://github.com/liby3/ROSProjet/blob/mrslam/photos/NodeCommunication.png)


##	4.	Bagfiles

	laser datas for mrslam test.

baidu cloud: https://pan.baidu.com/s/1eSj77Xo




	

