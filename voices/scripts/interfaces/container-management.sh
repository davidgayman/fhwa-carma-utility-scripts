#!/bin/bash
source bashbase.sh

# Define the following in subscripts:
# DOCKERFILE
# IMAGE_NAME
# CONTAINER_NAME
# CONTAINER_RUN_OPTIONS

# Use a standard volume mapping
INSTALLATION_PACKAGE_PATH=$HOME/voices/installation-packages
DOCKER_VOLUME_MAPPING="-v ${INSTALLATION_PACKAGE_PATH}:${INSTALLATION_PACKAGE_PATH}"

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

  ENV HOST_INSTALLATION_PACKAGE_PATH=$HOME/voices-large-files
  ENV INSTALLATION_PACKAGE_PATH=$HOME/voices-large-files
  sudo docker run --rm -v HOST_INSTALLATION_PACKAGE_PATH:INSTALLATION_PACKAGE_PATH -v /Users/$INSTALL_TENA_USERNAME/$INSTALL_TENA_DIR:/home tena:v2xhub /home/Downloads/TENA-MiddlewareSDK-v6.0.8.B@Product@u2004-gcc9-64-va0b09d44.bin -i /home --auto

  docker build ${DOCKER_VOLUME_MAPPING} --force-rm --rm -f ./Dockerfile -t tena:carla .
}

#push() {
#  docker push
#}

devsh() {
  run
  docker exec ${DOCKER_VOLUME_MAPPING} -it $CONTAINER_NAME clion
}

#pull() {
#  docker pull
#}
#
#install() {
#}
#
run() {
  docker run ${DOCKER_VOLUME_MAPPING} $IMAGE_NAME as $CONTAINER_NAME $CONTAINER_RUN_OPTIONS
}
#
#sh() {
#  docker exec ${DOCKER_VOLUME_MAPPING} -it $CONTAINER_NAME /bin/bash
#}
#
#stop() {
#  docker stop ${DOCKER_VOLUME_MAPPING} $CONTAINER_NAME
#}
