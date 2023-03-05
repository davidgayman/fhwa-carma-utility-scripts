#!/bin/bash
source /opt/bashbase.sh

# Define the following in subscripts:
# IMAGE_NAME
# CONTAINER_NAME
# CONTAINER_RUN_OPTIONS

COMMAND_LIST += [
  "build"       "Build the image."
  "push"        "Push the image to the global repository."
  "pull"        "Pull a pre-built image."
  "install"     "Install as a persistent service on the system."
  "run"         "Run the service."
  "stop"        "Stop the service."
]

build() {
  docker build $IMAGE_NAME
}

push() {
  docker push
}

pull() {
  docker pull
}

install() {
}

run() {
  docker run $IMAGE_NAME as $CONTAINER_NAME $CONTAINER_RUN_OPTIONS
}

stop() {
  docker stop $CONTAINER_NAME
}
