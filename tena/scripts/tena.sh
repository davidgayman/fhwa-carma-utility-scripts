#!/bin/bash

# ------------------------------------------------------------------------------
# Description
# ------------------------------------------------------------------------------

# Provide concise TENA interfacing.

# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------

# Environment
TENA_HOME=/home/carma/TENA
#TENA_HOME=/opt/TENA
TENA_PLATFORM=u2004-gcc9-64-d
TENA_VERSION=6.0.8
VUG_INSTALL_DIR=/opt/TENA/lib
#VUG_INSTALL_DIR=/home/carma/code/stol/voices/tena-adapters/scenario-publisher/local-install
BOOST_INCLUDEDIR=/usr/include/boost
#BOOST_INCLUDEDIR=/home/carma/code/stol/voices/.../
CARLA_HOME=/home/carma/CARLA
BOOST_VERSION=TENA_boost_1.77.0.1_Library
CMAKE_PREFIX_PATH="${TENA_HOME}/lib/cmake"
BOOST_INCLUDEDIR=${TENA_HOME}/${BOOST_VERSION}/${TENA_VERSION}/include

# Build options
N_JOBS=4


# ------------------------------------------------------------------------------
# Implementation
# ------------------------------------------------------------------------------

install-tena() {

}


install-tena-env() {
  # Register environment into user profile
  echo "source /opt/TENA/${TENA_VERSION}/scripts/tenaenv-${TENA_PLATFORM}-v${TENA_VERSION}.sh &>/dev/null" >>~/.bashrc
}


env-load() {
  source /opt/TENA/${TENA_VERSION}/scripts/tenaenv-${TENA_PLATFORM}-v${TENA_VERSION}.sh &>/dev/null

  echo "TENA_HOME=${TENA_HOME}"
  echo "TENA_PLATFORM=${TENA_PLATFORM}"
  echo "TENA_VERSION=${TENA_VERSION}"
  echo "VUG_INSTALL_DIR=${VUG_INSTALL_DIR}"
  echo "BOOST_INCLUDEDIR=${BOOST_INCLUDEDIR}"
  echo "CARLA_HOME=${CARLA_HOME}"
  echo "BOOST_VERSION=${BOOST_VERSION}"
  echo "CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}"
  echo "BOOST_INCLUDEDIR=${BOOST_INCLUDEDIR}"

  export TENA_HOME
  export TENA_PLATFORM
  export TENA_VERSION
  export VUG_INSTALL_DIR
  export BOOST_INCLUDEDIR
  export CARLA_HOME
  export BOOST_VERSION
  export CMAKE_PREFIX_PATH
  export BOOST_INCLUDEDIR
}




doc() {
  DOC_ROOT_DIR=${TENA_HOME}/${TENA_VERSION}/doc
  DOC_DOXYGEN_DIR=${DOC_ROOT_DIR}/doxygen
  DOC_HTML_DIR=${DOC_ROOT_DIR}/html
  DOC_HTML_INDEX=${DOC_HTML_DIR}/index.html
  DOC_URL=file://${DOC_HTML_INDEX}

  # Determine if html documentation exists, and generate if not present
  if [[ ! -f ${DOC_HTML_INDEX} ]]; then
    sudo apt-get install -y doxygen
    #sudo apt-get install -y dot  # No such package??
    cd ${DOC_DOXYGEN_DIR} && make -j${N_JOBS} all
  fi

  # Launch in browser
  echo "Open documentation in a web browswer at: ${DOC_URL}"
  xdg-open ${DOC_URL}
}


print_help() {
cat <<'_HELP_TEXT'

voices <command> <args>

Commands marked with [root] need to be run as root.

Commands:
  install-tena      [root] Install the TENA system.
  install-tena-env  Install the TENA environment variables.

  env-load          Load TENA-related environment variables to enable development.

  start-console     Start the TENA Console application.
  start-em          Start the TENA Execution Manager.

  doc               [root] View the TENA SDK documentation.
  help              Print this help information.

_HELP_TEXT
}


# ------------------------------------------------------------------------------
# Run
# ------------------------------------------------------------------------------

# Execute the script with forward-declared functions
main $@

}
