<h1 align="center">
  <br>
 <img src="https://github.com/Vamshi2198/Home-Service-Robot/blob/main/images/Project-Title.png">
  <br>
</h1>
  
<h2 align="center">A robot that will autonomously map an environment and navigate to pickup and deliver objects!</h2>
  
<p align="center">
  <a href="https://www.udacity.com/robotics">
     <img src="https://s3-us-west-1.amazonaws.com/udacity-robotics/Extra+Images/RoboND_flag.png">
  </a>
  <a href="https://husarion.com/manuals/rosbot/">
     <img src="https://github.com/Vamshi2198/Go-Chase-it-/blob/main/src/images/husarion.jpg" width = "100" height = "50" >
  </a>
  <a href="https://aws.amazon.com/robomaker/">
     <img src="https://github.com/Vamshi2198/Go-Chase-it-/blob/main/src/images/aws.png" width = "100" height = "50">
  </a>
</p>

<p align="center">
  <a href="#overview">Overview</a> •
  <a href="#prerequisites">Prerequisites</a> •
  <a href="#directory-structure">Directory Structure</a> •
  <a href="#how-to-launch">How To Launch</a> •
  <a href="#testing">Testing</a>
</p>


## Overview  
This project is a part of Udacity's Robotics Software Engineer Nanodegree Program. In this project, I used [ROSbot](https://github.com/husarion/rosbot_description) as a mobile robot and [aws-robomaker-small-house-world](https://github.com/aws-robotics/aws-robomaker-small-house-world) as a gazebo world to replicate realistic simulation.

### Mapping:  
* The script file that performs mapping is `test_slam.sh`. This script is used to manually test SLAM.

### Localization and Navigation:  
* The script file that performs localization and navigation is `test_navigation.sh`. This script file is used for manual navigation test. The robot should be able to navigate in the environment after a 2D Nav Goal command is issued.
* The file starts map_server node, amcl from package navigation node and move_base from navigation package node.To know more about this package, checkout my other project focused on amcl pakgae [here](https://github.com/Vamshi2198/Where-am-I).

### pick_objects.sh
This script file runs pick_objects node from pick_objects package in addition to the `test_navigation.sh`. This file  will send multiple goals for the robot to reach.The robot travels to the desired pickup zone, displays a message that it reached its destination, waits 5 seconds, travels to the desired drop off zone, and displays a message that it reached the drop off zone.

### add_marker.sh
This script file runs add_marker node from add_marker package in addition to the `test_navigation.sh`. and  The node analyzes command line arguments, set marker properties and publishes topic visualization_marker to rviz.

### home_service.sh
The marker from 'add_marker.sh` should initially be published at the pickup zone. After 5 seconds it should be hidden. Then after another 5 seconds it should appear at the drop off zone. The home_service.sh file that will run all the nodes as:

* Initially show the marker at the pickup zone.
* Hide the marker once your robot reach the pickup zone.
* Wait 5 seconds to simulate a pickup.
* Show the marker at the drop off zone once your robot reaches it.

## Prerequisites
* Gazebo >= 7.0  
* ROS >= Kinetic  
* ROS navigation package  
```
sudo apt-get install ros-${ROS_DISTRO}-navigation
```
* ROS map_server package  
```
sudo apt-get install ros-${ROS_DISTRO}-map-server
```
* ROS move_base package  
```
sudo apt-get install ros-${ROS_DISTRO}-move-base
```
* ROS amcl package  
```
sudo apt-get install ros-${ROS_DISTRO}-amcl
```
* xterm
```
sudo apt-get install -y xterm
```
* make >= 4.1(mac, linux), 3.81(Windows)
  * Linux: make is installed by default on most Linux distros
  * Mac: [install Xcode command line tools to get make](https://developer.apple.com/xcode/features/)
  * Windows: [Click here for installation instructions](http://gnuwin32.sourceforge.net/packages/make.htm)
* gcc/g++ >= 5.4
  * Linux: gcc / g++ is installed by default on most Linux distros
  * Mac: same deal as make - [install Xcode command line tools](https://developer.apple.com/xcode/features/)
  * Windows: recommend using [MinGW](http://www.mingw.org/)


## Directory Structure  
```
.Home-Service-Robot                            # Home-Service-Robot Project
├── catkin_ws                                  # Catkin workspace
│   ├── images
│   ├── scripts
│   │   ├── add_marker.sh                      # shell script that launches the turtlebot , AMCL , rviz , and add_markers node        
│   │   ├── home_service.sh                    # script file that launches home-service-robot        
│   │   ├── pick_objects.sh                    # script file that launches the turtlebot , AMCL , rviz and your pick_objects node
│   │   ├── test_navigation.sh                 # Localization and Navigation Testing script       
│   │   ├── test_slam.sh                       # SLAM testing script        
│   ├── src
│   │   ├── add_markers    
│   │   │   ├── src                        
│   │   │   │   ├── add_markers.cpp            #add_marker node
│   │   │   ├── CMakeLists.txt
│   │   │   ├── package.xml                    
│   │   ├── aws-robomaker-small-house-world    # folder that contains small-house world
│   │   ├── my_robot                           # my_robot package        
│   │   │   ├── launch                         # launch folder for launch files  
│   │   │   │   ├── mapping.launch
│   │   │   │   ├── robot_description.launch
│   │   │   │   ├── world.launch               # Launches bookstore world
│   │   │   │   ├── teleop.launch              # To drive the rosbot
│   │   │   ├── meshes                         # meshes folder for sensors
│   │   │   │   ├── astra.stl
│   │   │   │   ├── box.stl
│   │   │   │   ├── rplidar.stl
│   │   │   │   ├── upper.stl
│   │   │   │   ├── wheel.stl
│   │   │   ├── realsense2_camera              # folder that contains launch files for realsense camera
│   │   │   ├── realsense2_description         # folder that contains description files for realsense camera
│   │   │   ├── urdf                           # urdf folder for xarco files
│   │   │   │   ├── materials.xacro            #contains material properties used in rosbot
│   │   │   │   ├── my_robot.xacro             
│   │   │   │   ├── rosbot.gazebo              #contains plugins to interact with rosbot
│   │   │   ├── worlds                         # world folder for world files
│   │   │   │   ├── empty.world
│   │   ├── pick_objects   
│   │   │   ├── src                        
│   │   │   │   ├── pick_objects.cppadd_markers.cpp    # pick_objects node
│   │   │   ├── CMakeLists.txt
│   │   │   ├── package.xml                    
│   │   ├── slam-gmapping                      # folder that contains launch file for SLAM testing
│   │   ├── teleop_twist_keyboard              # folder that contains teleop node
│   │   ├── CMakeLists.txt                     # compiler instructions
```

## How To Launch

#### Clone the project in catkin_ws/src/ and source the environment
```sh
$ cd /home/workspace/catkin_ws/src/
$ git clone https://github.com/Vamshi2198/Home-Service-Robot
$ source /opt/ros/${ROS_DISTRO}/setup.bash
```
#### Note : The world file proivided is empy because it only contains the url of remote repository, for this purpose you need to clone the aws-bookstore-world and place it inside your src folder. Also, delete the folder named aws-robomaker-bookstore-world manually before cloning.
```sh
$ cd /home/workspace/catkin_ws/src/Home-Service-Robot/src/
$ git clone https://github.com/aws-robotics/aws-robomaker-small-house-world
```
#### Also, repeat the same with teleop_twist_keyboard packages. i.e, remove the empty file folder and clone the packages
```sh
$ cd /home/workspace/catkin_ws/src/Home-Service-Robot/src/
$ git clone https://github.com/ros-teleop/teleop_twist_keyboard
```
#### Build the `Home-Service-Robot` project
```sh
$ cd /home/workspace/catkin_ws/ 
$ catkin_make
```
#### After building the package, source your workspace
```sh
$ cd /home/workspace/catkin_ws/
$ source devel/setup.bash
```
#### Navigate to scripts folder and run `home_service.sh` shell script to test virtual objects
```sh
$ ./home_service.sh
```
### Note: you need to give permission to run the script file by:
```sh
$ chmod +x <scriptfile>
```
if you want to test individual scrpits follow the same procedure as above.


## Testing
After launching the `home_service.sh` script file, you can see the marker appears in blue and is picked up and dropped off depending on the location parameters.

The code was tested on the following specifications:
- **Processor:** `Intel Core i7-10875H`
- **Graphics:** `Nvidia GeForce GTX 1650 Ti 4GB GDDR6`
- **OS:** ` Ubuntu 20.04.3 LTS`
- **Kernal:** `5.10.60.1-microsoft-standard-WSL2`
- **ROS:** `noetic`

