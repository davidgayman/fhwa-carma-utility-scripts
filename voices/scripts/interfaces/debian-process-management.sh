#!/bin/bash
source /opt/bashbase.sh

# Define the following in subscripts:
# CMAKE_SOURCE_DIR
# CMAKE_BUILD_DIR
# PACKAGE_NAME
# PROGRAM_NAME

NUM_JOBS=4

COMMAND_LIST += [
  "configure"   "Configure the dependencies and environment to enable a build by way of the \`build\` command or a development environment."
  "build"       "Compile and package the solution."
  "push"        "Push the package to the global repository."

  "pull"        "Pull a pre-built package."
  "install"     "Install to the system."
  "run"         "Launch the program."
  "stop"        "Stop the program."
  "monitor"     "Launch monitoring tools for the program."
]

configure() {
  mkdir $CMAKE_BUILD_DIR
  cd $CMAKE_BUILD_DIR
  cmake $CMAKE_SOURCE_DIR
}

build() {
  make -j$NUM_JOBS
}

push() {
  dpkg push $PACKAGE_NAME
}

pull() {
  dpkg pull $PACKAGE_NAME
}

install() {
  dpkg -i --force-overwrite $PACKAGE_NAME
}

run() {
  $PROGRAM_NAME
}

stop() {
  $PROGRAM_NAME stop
}