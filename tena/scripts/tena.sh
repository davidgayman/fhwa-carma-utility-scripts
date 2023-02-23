#!/bin/bash

# ------------------------------------------------------------------------------
# Description
# ------------------------------------------------------------------------------

# Provide concise TENA interfacing.

# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------

# Environment
TENA_HOME=/opt/TENA
TENA_PLATFORM=u2004-gcc9-64-d
TENA_VERSION=6.0.9
VUG_INSTALL_DIR=/opt/TENA/lib
#VUG_INSTALL_DIR=/home/carma/code/stol/voices/tena-adapters/scenario-publisher/local-install
BOOST_INCLUDEDIR=/usr/include/boost
#BOOST_INCLUDEDIR=/home/carma/code/stol/voices/.../

# Build options
N_JOBS=4

# ------------------------------------------------------------------------------
# Process Arguments
# ------------------------------------------------------------------------------

main() {

  # Handle only the first command passed into the script
  case $1 in

    install-tena) install;;
    install-tena-env) install-tena-env;;

    env-load) env-load;;

    start-console) start-console;;
    start-em) start-em;;

    doc) doc;;

    help) print_help;;
    --help) print_help;;
    *) print_help;;

  esac;

  # Exit with code
  exit 0
}


# ------------------------------------------------------------------------------
# Implementation
# ------------------------------------------------------------------------------

install-tena() {

  # TENA Framework
  dpkg --force-overwrite -i 'TENA-StandardOMsSDK-v2.0.0/TENA-StandardOMsSDK-v2.0.0@Product@u2004-gcc9-64-d-v99ae11aa.deb'
  dpkg --force-overwrite -i 'TENA-Console-v2.0.1/TENA-Console-v2.0.1@Product@u2004-gcc9-64-v244836f9.deb'
  dpkg --force-overwrite -i 'TENA-MiddlewareSDK-v6.0.9.A/TENA-MiddlewareSDK-v6.0.9.A@Product@u2004-gcc9-64-d-va3bc16dc.deb'
  dpkg --force-overwrite -i 'TENA-Canary-v1.0.13/TENA-Canary-v1.0.13@Product@u2004-gcc9-64-vdbd87712.deb'

  # VOICES Framework
  cp * ${TENA_HOME}/lib  # Copy custom TENA libraries to system
  cp tena-cmake-package ${TENA_HOME}/lib

  #...VOICES components are deployed locally to ${VUG_INSTALL_DIR}/scenario-publisher-1.0.0/lib

  # VOICES Adapters
}


install-tena-env() {
  # Register environment into user profile
  echo "source /opt/TENA/${TENA_VERSION}/scripts/tenaenv-${TENA_PLATFORM}-v${TENA_VERSION}.sh &>/dev/null" >>~/.bashrc
}


env-load() {
  source /opt/TENA/${TENA_VERSION}/scripts/tenaenv-${TENA_PLATFORM}-v${TENA_VERSION}.sh &>/dev/null
}


start-console() {
  /opt/TENA/Console-v2.0.1/start.sh
}


start-em() {
  # Start em from command line; easier to launch from the Console GUI
  TENA_LISTEN_ENDPOINT_IP=
  TENA_LISTEN_ENDPOINT_PORT=
  TENA_MULTICAST_ENDPOINT_IP=
  TENA_MULTICAST_ENDPOINT_PORT=

  $TENA_HOME/executionManager-v${TENA_VERSION}/start.sh \
    -listenEndpoints ${TENA_LISTEN_ENDPOINT_IP}:${TENA_LISTEN_ENDPOINT_PORT} \
    -multicastProperties ${TENA_MULTICAST_ENDPOINT_IP}:${TENA_MULTICAST_ENDPOINT_PORT}
}


doc() {
  DOC_ROOT_DIR=${TENA_HOME}/${TENA_VERSION}/doc
  DOC_DOXYGEN_DIR=${DOC_ROOT_DIR}/doxygen
  DOC_HTML_DIR=${DOC_ROOT_DIR}/html
  DOC_HTML_INDEX=${DOC_HTML_DIR}/index.html
  DOC_URL=file://${DOC_HTML_INDEX}

  # Determine if html documentation exists, and generate if not present
  if [[ ! -f ${DOC_HTML_INDEX} ]]; then
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
