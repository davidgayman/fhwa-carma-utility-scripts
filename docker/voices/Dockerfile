FROM ubuntu:20.04

# ------------------------------------------------------------------------------
# Scripts
# ------------------------------------------------------------------------------

RUN mkdir -p /opt/carma/carma-utils
COPY scripts /opt/carma/carma-utils/scripts

ENV CARMA_INSTALL_ROOT=/opt/carma
ENV CARMA_UTILITIES_ROOT=/opt/carma/carma-utils
ENV CARMA_SCRIPT_ROOT=/opt/carma/carma-utils/scripts
ENV CARMA_DOCKER_ROOT=/opt/carma/carma-utils/docker

ENV PATH="${PATH}:/opt/carma/carma-utils/scripts:/opt/carma/carma-utils/scripts/scripts-base:/opt/carma/carma-utils/scripts/support:/opt/carma/carma-utils/scripts/voices:/opt/carma/carma-utils/scripts/voices/process:/opt/carma/carma-utils/scripts/voices/process/mw-scripts:/opt/carma/carma-utils/scripts/voices/process/net-scripts"

# ------------------------------------------------------------------------------
# System Setup
# ------------------------------------------------------------------------------

# Set up system environment
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/New_York"

# Basic update
RUN apt-get update -y && apt-get upgrade -y

# Install basic programs
RUN apt-get install -y snapd
RUN systemctl enable snapd
RUN apt-get install -y git vim tree

# Update the system
RUN apt-get update && apt-get install -y wget software-properties-common && add-apt-repository ppa:ubuntu-toolchain-r/test && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - && apt-add-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-9 main" && apt-get update
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
RUN apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main"
RUN apt update

# Obtain python2 and python2-pip
RUN add-apt-repository universe
RUN apt update

# Install pip for python2
RUN DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install -y python2 curl openssl
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python2 get-pip.py

# Install build tools
RUN apt-get install -y cmake git build-essential clang-8 g++-7 lld-8 g++-8 ninja-build libvulkan1 python2 python3-dev python3-pip libpng-dev libtiff5-dev libjpeg-dev tzdata sed curl unzip autoconf libtool rsync libxml2-dev && pip2 install --user setuptools && pip3 install --user -Iv setuptools==47.3.1 && pip2 install --user distro && pip3 install --user distro && update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-8/bin/clang++ 180 && update-alternatives --install /usr/bin/clang clang /usr/lib/llvm-8/bin/clang 180

# Network Monitoring Tools
RUN apt-get install -y tcpdump htop iftop nload net-tools

# ------------------------------------------------------------------------------
# VPN
# ------------------------------------------------------------------------------

# Twingate vpn-client
RUN curl -S 'https://binaries.twingate.com/client/linux/install.sh' | sudo bash
#  RUN twingate setup --headless $HOME/.twingate/service_key.json

# ------------------------------------------------------------------------------
# TENA
# ------------------------------------------------------------------------------

ENV TENA_HOME=/opt
ENV TENA_VERSION=6.0.8
ENV TENA_PLATFORM=u2004-gcc9-64
ENV VUG_INSTALL_DIR=/opt/carma/TENA-VUG

RUN mkdir -p $TENA_HOME/TENA
RUN mkdir -p $VUG_INSTALL_DIR
RUN mkdir -p /tmp/binaries-mw-framework

COPY ./.binaries/mw-framework /tmp/binaries-mw-framework

# Install the middleware
RUN /tmp/binaries-mw-framework/TENA-MiddlewareSDK-v6.0.8.B@Product@u2004-gcc9-64-va0b09d44.bin -i $TENA_HOME --auto
RUN /tmp/binaries-mw-framework/TENA-StandardOMsSDK-v2.0.0@Product@u2004-gcc9-64-v54c2ccf3.bin -i $TENA_HOME --auto
RUN /tmp/binaries-mw-framework/VUG-VOICES-Combined-Distribution-v0.12.0@Product@u2004-gcc9-64-v1976e608.bin -i $TENA_HOME --auto
RUN /tmp/binaries-mw-framework/VUG-j2735-Distribution-v0.1.1@Product@u2004-gcc9-64-vf9c7e345.bin -i $TENA_HOME --auto

# Install monitoring applications
RUN dpkg -i --force-overwrite /tmp/binaries-mw-monitor/TENA-Console-v2.0.1@Product@u2004-gcc9-64-v244836f9.deb
RUN dpkg -i --force-overwrite /tmp/binaries-mw-monitor/TENA-Canary-v1.0.13@Product@u2004-gcc9-64-vdbd87712.deb

# Install the CMake dependency management solution
COPY .source-repositories/tena-cmake-package/cmake /opt/TENA/lib/cmake

# Build and install the adapters
COPY .source-repositories/tena-traffic-light-entity-generator /opt/carma/voices/mw-adapters/tena-traffic-light-entity-generator
COPY .source-repositories/tena-j2735-message-adapter /opt/carma/voices/mw-adapters/tena-j2735-message-adapter
# TODO

# ------------------------------------------------------------------------------
# CARLA
# ------------------------------------------------------------------------------

# Configure the CARLA source
WORKDIR /home
RUN git clone https://github.com/carla-simulator/carla.git
WORKDIR /home/carla/Examples/CppClient
RUN git checkout tags/0.9.10.1 -b voices

# Resolve error from xerces 3.2.3 no longer being available online
RUN find /home/carla -type f -exec sed -i 's/XERCESC_VERSION=3.2.3/XERCESC_VERSION=3.2.4/g' {} \;

# Build CARLA
RUN make
