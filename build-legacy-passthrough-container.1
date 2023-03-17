#!/bin/bash

# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------

# Description
DESCRIPTION="Control script for this project."

# Locate this base script
THIS_COMMAND=$(basename $BASH_SOURCE)
CMAKE_SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
EXE_NAME=$(basename $CMAKE_SOURCE_DIR)

# Define a set of commands
declare -A COMMAND_LIST
COMMAND_LIST["help"]="Print this help information."
COMMAND_LIST["build-docker"]="Build the helper docker image."
COMMAND_LIST["build"]="build <debug|release>  Build the code."
COMMAND_LIST["run"]="run <debug|release>  Run the solution."

# build-docker parameters
DOCKER_IMAGE_NAME=tena-builder:latest

# local parameters
TENA_HOME=/home/carma/TENA
TENA_VERSION=6.0.8
TENA_PLATFORM=u2004-gcc9-64
VUG_INSTALL_DIR=/home/carma/TENA/install
INSTALL_DIR=/home/carma/TENA/install

# remote parameters
REMOTE__TENA_HOME=/home/TENA
REMOTE__CARLA_HOME=/home/carla
REMOTE__INSTALL_DIR=/home/INSTALL
BOOST_VERSION="TENA_boost_1.77.0.1_Library"

# build and run docker parameters
DOCKER_RUN_OPTIONS="--entrypoint /bin/bash --rm"
REMOTE__CMAKE_SOURCE_DIR=/home/$EXE_NAME
DOCKER_VOLUME_MAPPING="-v $CMAKE_SOURCE_DIR:$REMOTE__CMAKE_SOURCE_DIR -v $TENA_HOME:$REMOTE__TENA_HOME -v $INSTALL_DIR:$REMOTE__INSTALL_DIR"

# cmake parameters
CMAKE_EXPORT_COMPILE_COMMANDS=ON
ENV_EXPORT_COMMANDS="export TENA_HOME=$REMOTE__TENA_HOME; \
  export TENA_VERSION=$TENA_VERSION; \
  export TENA_PLATFORM=$TENA_PLATFORM; \
  export CARLA_HOME=$REMOTE__CARLA_HOME;"

# build parameters
NUM_BUILD_JOBS=4

# run parameters
EXE_PARAMETERS="-emEndpoints 192.168.50.240:55100 -listenEndpoints 127.0.0.1 -intersectionID 1"

# ------------------------------------------------------------------------------
# Process Arguments
# ------------------------------------------------------------------------------

main() {

  # Call the relevant operation (1:1 mapping of command:function)
  COMMAND=$1
  shift
  $COMMAND $@
  exit 0
}

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

help() {
  printf "%s\n" "$0 <command> <args>"
  printf "\n"
  printf "%s\n" "$DESCRIPTION"
  printf "\n"
  printf "Commands:\n"
  for COM in ${!COMMAND_LIST[@]}; do
    printf "\t%s\t\t\t%s\n" "$COM" "${COMMAND_LIST[$COM]}"
  done
  printf "\n"
}

build-docker() {
  sudo -E docker build -f docker/Dockerfile -t $DOCKER_IMAGE_NAME .
}

build() {
  CMAKE_BUILD_TYPE=${1^^}
  echo "CMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE"
  CMAKE_BUILD_DIR=build-app-$CMAKE_BUILD_TYPE
  mkdir -p $CMAKE_BUILD_DIR

  printf "\n** Configuring Project **\n\n"
  CMAKE_COMMAND="cmake -D CMAKE_EXPORT_COMPILE_COMMANDS=$CMAKE_EXPORT_COMPILE_COMMANDS \
    -D CMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
    -D CMAKE_PREFIX_PATH='$REMOTE__TENA_HOME/lib/cmake;$REMOTE__INSTALL_DIR' \
    -D BOOST_INCLUDEDIR=$REMOTE__TENA_HOME/$BOOST_VERSION/$TENA_PLATFORM/include \
    -D VUG_INSTALL_DIR=$REMOTE__INSTALL_DIR \
    -Wno-dev \
    ../"
  DOCKER_COMMAND="cd $REMOTE__CMAKE_SOURCE_DIR/$CMAKE_BUILD_DIR; $ENV_EXPORT_COMMANDS $CMAKE_COMMAND"
  sudo docker run $DOCKER_RUN_OPTIONS $DOCKER_VOLUME_MAPPING $DOCKER_IMAGE_NAME -c "$DOCKER_COMMAND"

  printf "\n** Compiling **\n\n"
  DOCKER_COMMAND="cd $REMOTE__CMAKE_SOURCE_DIR/$CMAKE_BUILD_DIR; $ENV_EXPORT_COMMANDS make -j $NUM_BUILD_JOBS"
  sudo docker run $DOCKER_RUN_OPTIONS $DOCKER_VOLUME_MAPPING $DOCKER_IMAGE_NAME -c "$DOCKER_COMMAND"

  printf "\n** Installing **\n\n"
  DOCKER_COMMAND="cd $REMOTE__CMAKE_SOURCE_DIR/$CMAKE_BUILD_DIR; $ENV_EXPORT_COMMANDS make install"
  sudo docker run $DOCKER_RUN_OPTIONS $DOCKER_VOLUME_MAPPING $DOCKER_IMAGE_NAME -c "$DOCKER_COMMAND"
}

run() {
  CMAKE_BUILD_TYPE=${1^^}
  CMAKE_BUILD_DIR=build-app-$CMAKE_BUILD_TYPE
  $CMAKE_BUILD_DIR/src/$EXE_NAME $EXE_PARAMETERS
}

# ------------------------------------------------------------------------------
# Execute the script
# ------------------------------------------------------------------------------

main $@
