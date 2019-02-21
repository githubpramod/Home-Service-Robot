#!/bin/sh
catkin_dir=/home/workspace/catkin_ws
catkin_src_dir=$catkin_dir/src

xterm  -e  " roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$catkin_src_dir/Worlds/WorldU.world" &
sleep 5

xterm -e " roslaunch turtlebot_gazebo gmapping_demo.launch custom_gmapping_launch_file:=$catkin_src_dir/turtlebot_simulator/turtlebot_gazebo/launch/gmapping.launch.xml" &
sleep 2

xterm -e " source $catkin_dir/devel.setup.bash; rosrun wall_follower wall_follower_node" &
sleep 2

xterm -e " roslaunch turtlebot_rviz_launchers view_navigation.launch"
