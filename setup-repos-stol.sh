#!/bin/bash


# Further instructions at:
# - https://usdot-carma.atlassian.net/wiki/spaces/CRMPLT/pages/486178841/Setup+CARMA+Platform+Prerequisites
# - https://usdot-carma.atlassian.net/wiki/spaces/CRMPLT/pages/488472599/Setup+CARMA+Platform+Runtime
# - https://usdot-carma.atlassian.net/wiki/spaces/CRMPLT/pages/491651073/Using+a+CARMA+Platform+development+environment


# Install Linux tools
sudo apt-get install -y git vim tree docker snapd net-tools cmake curl
sudo apt-get clean
sudo apt-key update
sudo apt-get update
sudo apt-get full-upgrade -y
sudo apt autoremove -y


# Setup Docker
echo 'export DOCKER_HOST_IP=$(ifconfig docker0 | awk "/inet/ {print $2}")' >>~/.bashrc
sudo chown $USER /var/run/docker.sock
#cd /tmp
#curl -L https://raw.githubusercontent.com/usdot-fhwa-stol/carma-platform/develop/engineering_tools/install-docker.sh | bash
#sudo docker login


# Set up CARMA dependencies
sudo usermod  --uid 1000 carma
sudo groupmod --gid 1000 carma


## Add VCS Sources
#sudo apt-get install -y lsb-release
#sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'


## Add ROS Key
#sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654


## Install VCS
#sudo apt-get update
#sudo apt-get install python3-vcstool


## Add VCS auto completion
#echo "source /usr/share/vcstool-completion/vcs.bash" >> ~/.bashrc


## Add git branch display to terminal (optional)
#(
#echo "parse_git_branch() {"
#echo "     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'"
#echo "}"
#echo "#Add git branch and timestamp to bash commands"
#echo export PS1='"\t \u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "'
#) >> ~/.bashrc



# Setup CARMA Scripts
#sudo curl -o /usr/bin/carma -L https://raw.githubusercontent.com/usdot-fhwa-stol/carma-platform/develop/engineering_tools/carma
#sudo chmod ugo+x /usr/bin/carma
#sudo curl -o /etc/bash_completion.d/__carma_autocomplete -L https://raw.githubusercontent.com/usdot-fhwa-stol/carma-platform/develop/engineering_tools/__carma_autocomplete
#sudo chmod ugo+x /etc/bash_completion.d/__carma_autocomplete


# Setup the /opt/carma folder
#sudo curl -L https://raw.githubusercontent.com/usdot-fhwa-stol/carma-platform/develop/engineering_tools/opt_carma_setup.bash > ~/opt_carma_setup.bash
#sudo bash ~/opt_carma_setup.bash ~/carma_ws/src/carma-config/example_calibration_folder/vehicle
#rm ~/opt_carma_setup.bash



# Set up code directories
SRC_ROOT=~/code/stol
mkdir -p ${SRC_ROOT}/vehicle
mkdir -p ${SRC_ROOT}/sim
mkdir -p ${SRC_ROOT}/roadside


# Clone repositories
cd ${SRC_ROOT}/vehicle
#git clone https://github.com/usdot-fhwa-stol/autoware.ai.git
#git clone https://github.com/usdot-fhwa-stol/carma-platform.git

cd ${SRC_ROOT}/sim
#git clone https://github.com/usdot-fhwa-stol/carma-simulation.git
#git clone https://github.com/usdot-fhwa-stol/carma-carla-integration.git

cd ${SRC_ROOT}/roadside
#git clone https://github.com/usdot-fhwa-stol/carma-streets.git
#git clone https://github.com/usdot-fhwa-OPS/V2X-Hub.git

