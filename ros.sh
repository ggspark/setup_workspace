#!/bin/bash

clear
echo "******************************************************************************"
echo -e "\e[1;92mInstalling ROS\e[0m"
echo "******************************************************************************"
sleep 5

echo -e "\e[1;92m*******Installing ROS*******\e[0m"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install ros-groovy-desktop-full
sudo apt-get -y install ros-groovy-rosbridge-suite
sudo rosdep init
rosdep update
sudo apt-get install -y ros-groovy-joy
sudo apt-get install -y python-rosinstall
sudo apt-get install -y ros-groovy-laser-drivers
echo "source /opt/ros/groovy/setup.bash" >> ~/.bashrc

sudo sed -i 's/CATKIN_SHELL=$CATKIN_SHELL "$_SETUP_UTIL" $@ > $_SETUP_TMP/CATKIN_SHELL=$CATKIN_SHELL "$_SETUP_UTIL" $@ >> $_SETUP_TMP/g' /opt/ros/groovy/setup.sh

sudo sed -i 's/while [ $_i -lt $_CATKIN_ENVIRONMENT_HOOKS_COUNT ]; do/while [[ $_i -lt $_CATKIN_ENVIRONMENT_HOOKS_COUNT ]]; do/g' /opt/ros/groovy/setup.sh

