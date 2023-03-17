FROM ubuntu:20.04

# Set up system environment
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/New_York"
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y snapd
RUN systemctl enable snapd
RUN apt-get install -y git vim tree

# Copy scripts in
RUN mkdir -p /opt/carma/carma-utils
COPY scripts /opt/carma/carma-utils/scripts

RUN apt-get install -y tcpdump htop iftop nload net-tools

ENV CARMA_INSTALL_ROOT=/opt/carma
ENV CARMA_UTILITIES_ROOT=/opt/carma/carma-utils
ENV CARMA_SCRIPT_ROOT=/opt/carma/carma-utils/scripts
ENV CARMA_DOCKER_ROOT=/opt/carma/carma-utils/docker

ENV PATH="${PATH}:/opt/carma/carma-utils/scripts:/opt/carma/carma-utils/scripts/scripts-base:/opt/carma/carma-utils/scripts/support:/opt/carma/carma-utils/scripts/voices:/opt/carma/carma-utils/scripts/voices/process:/opt/carma/carma-utils/scripts/voices/process/mw-scripts:/opt/carma/carma-utils/scripts/voices/process/net-scripts"

# Twingate vpn-client
RUN curl -S 'https://binaries.twingate.com/client/linux/install.sh' | sudo bash
#  RUN twingate setup --headless $HOME/.twingate/service_key.json

ENV TENA_HOME=/opt
ENV TENA_VERSION=6.0.8
ENV TENA_PLATFORM=u2004-gcc9-64
ENV VUG_INSTALL_DIR=/opt/carma/TENA-VUG

RUN mkdir -p $TENA_HOME/TENA
RUN mkdir -p $VUG_INSTALL_DIR
RUN mkdir -p /tmp/binaries-mw-framework

COPY ./.binaries/mw-framework /tmp/binaries-mw-framework

RUN /tmp/binaries-mw-framework/TENA-MiddlewareSDK-v6.0.8.B@Product@u2004-gcc9-64-va0b09d44.bin -i $TENA_HOME --auto
RUN /tmp/binaries-mw-framework/TENA-StandardOMsSDK-v2.0.0@Product@u2004-gcc9-64-v54c2ccf3.bin -i $TENA_HOME --auto
RUN /tmp/binaries-mw-framework/VUG-VOICES-Combined-Distribution-v0.12.0@Product@u2004-gcc9-64-v1976e608.bin -i $TENA_HOME --auto
RUN /tmp/binaries-mw-framework/VUG-j2735-Distribution-v0.1.1@Product@u2004-gcc9-64-vf9c7e345.bin -i $TENA_HOME --auto

RUN dpkg -i --force-overwrite /tmp/binaries-mw-monitor/TENA-Console-v2.0.1@Product@u2004-gcc9-64-v244836f9.deb
RUN dpkg -i --force-overwrite /tmp/binaries-mw-monitor/TENA-Canary-v1.0.13@Product@u2004-gcc9-64-vdbd87712.deb

ENV CARMA_INSTALL_ROOT=/opt/carma
ENV CARMA_UTILITIES_ROOT=/opt/carma/carma-utils
ENV CARMA_SCRIPT_ROOT=/opt/carma/carma-utils/scripts
ENV CARMA_DOCKER_ROOT=/opt/carma/carma-utils/docker

ENV PATH="${PATH}:/opt/carma/carma-utils/scripts:/opt/carma/carma-utils/scripts/scripts-base:/opt/carma/carma-utils/scripts/support:/opt/carma/carma-utils/scripts/voices:/opt/carma/carma-utils/scripts/voices/process:/opt/carma/carma-utils/scripts/voices/process/mw-scripts:/opt/carma/carma-utils/scripts/voices/process/net-scripts"

COPY .source-repositories/tena-traffic-light-entity-generator /opt/carma/voices/mw-adapters/tena-traffic-light-entity-generator
COPY .source-repositories/tena-j2735-message-adapter /opt/carma/voices/mw-adapters/tena-j2735-message-adapter
COPY .source-repositories/tena-cmake-package/cmake /opt/TENA/lib/cmake
