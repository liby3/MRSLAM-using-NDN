# README #

This package allows to convert a 2D laser map in the **g2o** format into an occupancy grid compatible with ROS/Stage.

### Requirements ###

* OpenCV
* [g2o](https://github.com/RainerKuemmerle/g2o) (and dependencies therein)
* [ROS](http://www.ros.org/)

### Installation ###

* Clone the repository in your catkin workspace
* Compile with ``catkin_make``

### How to use it? ###

Run the g2o2ros node using as input a 2D graph in **g2o** format created with your favourite mapper.

In a terminal type:

``$ rosrun g2o2ros g2o2ros input_graph.g2o output_map``

It will create a output_map.png and output_map.yaml compatible with ROS/Stage.

Optional parameters can be visualized running the node with the ``-h`` option.

Hint: You will probably want to tune the ``-usable_range`` and ``-resolution`` options among others.

