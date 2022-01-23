#!/bin/sh
cd ../
xterm -e "source ./devel/setup.bash; roslaunch my_robot world.launch" &
sleep  7
xterm -e "source ./devel/setup.bash; roslaunch my_robot amcl.launch" &
sleep 7
xterm -e "source ./devel/setup.bash; rosrun add_markers add_markers" &
sleep 7
xterm -e "source ./devel/setup.bash; rosrun pick_objects pick_objects" &
sleep 7
