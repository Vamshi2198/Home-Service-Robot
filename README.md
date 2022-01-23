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

## Prerequisites
* Gazebo >= 7.0  
* ROS >= Kinetic
* ROS rtabmap-ros package 
```
sudo apt-get install ros-${ROS_DISTRO}-rtabmap-ros
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
