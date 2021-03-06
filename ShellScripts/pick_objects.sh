#!/bin/sh
catkin_dir=/home/workspace/catkin_ws
catkin_src_dir=$catkin_dir/src

xterm  -e  " roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$catkin_src_dir/Worlds/WorldU.world" &
sleep 5

xterm -e " roslaunch turtlebot_gazebo amcl_demo.launch map_file:=$catkin_src_dir/Worlds/myMap.yaml" &

sleep 2

xterm -e " source $catkin_dir/devel/setup.bash; rosrun pick_objects pick_objects_node" &
sleep 2

xterm -e " roslaunch turtlebot_rviz_launchers view_navigation.launch"
