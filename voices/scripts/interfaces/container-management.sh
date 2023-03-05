#!/bin/bash
source bashbase.sh

# Define the following in subscripts:
# DOCKERFILE
# IMAGE_NAME
# CONTAINER_NAME
# CONTAINER_RUN_OPTIONS

COMMAND_LIST += [
  "build"       "Build the image."
#  "push"        "Push the image to the global repository."
  "devsh"       "Start the container, shell into it, and launch an IDE."

#  "pull"        "Pull a pre-built image."
#  "install"     "Install as a persistent service on the system."
  "run"         "Run the service."
#  "sh"          "Shell into a running container to access sub-commands to manage the system."
#  "stop"        "Stop the service."
]

build() {
#  docker build $DOCKERFILE $IMAGE_NAME
  docker build --force-rm --rm -f ./Dockerfile -t tena:carla .
}

#push() {
#  docker push
#}

devsh() {
  run
  docker exec -it $CONTAINER_NAME clion
}

#pull() {
#  docker pull
#}
#
#install() {
#}
#
run() {
  docker run $IMAGE_NAME as $CONTAINER_NAME $CONTAINER_RUN_OPTIONS
}
#
#sh() {
#  docker exec -it $CONTAINER_NAME /bin/bash
#}
#
#stop() {
#  docker stop $CONTAINER_NAME
#}