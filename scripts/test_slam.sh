#!/bin/sh
cd ../
xterm -e "source ./devel/setup.bash; roslaunch my_robot world.launch" &
sleep 5
xterm -e "source ./devel/setup.bash; roslaunch gmapping slam_gmapping_pr2.launch" &
sleep 5
xterm -e "source ./devel/setup.bash; rosrun teleop_twist_keyboard teleop_twist_keyboard.py" &
sleep 5
