#!/bin/bash

# ------------------------------------------------------------------------------
# Description
# ------------------------------------------------------------------------------

# Provide concise TENA interfacing.

# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Process Arguments
# ------------------------------------------------------------------------------

main() {

  # Handle only the first command passed into the script
  case $1 in

    register-tena-commands) register-tena-commands;;
    start-console) start-console;;
    env-load) env-load;;
    start-em) start-em;;

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

env-load() {
  SOME_VERSION_INFO=u2004-gcc9-64-v6.0.9
  source /opt/TENA/${TENA_VERSION}/scripts/tenaenv-${SOME_VERSION_INFO}.sh

  VUG_INSTALL_DIR=/opt/TENA/lib
}


start-console() {
  /opt/TENA/Console-v2.0.1/start.sh
}


start-em() {
  # Start em from command line; easier to launch from the Console GUI
  TENA_VERSION=6.0.9
  TENA_LISTEN_ENDPOINT_IP=
  TENA_LISTEN_ENDPOINT_PORT=
  TENA_MULTICAST_ENDPOINT_IP=
  TENA_MULTICAST_ENDPOINT_PORT=

  $TENA_HOME/executionManager-v${TENA_VERSION}/start.sh \
    -listenEndpoints ${TENA_LISTEN_ENDPOINT_IP}:${TENA_LISTEN_ENDPOINT_PORT} \
    -multicastProperties ${TENA_MULTICAST_ENDPOINT_IP}:${TENA_MULTICAST_ENDPOINT_PORT}
}

print_help() {
cat <<'_HELP_TEXT'

voices <command> <args>

Commands:
  d              d.
  d              d.
  d              d.
  d              d.
  d              d.
  d              d.
  d              d.
  d              d.

  --help              Print this help information.

_HELP_TEXT
}


# ------------------------------------------------------------------------------
# Run
# ------------------------------------------------------------------------------

# Execute the script with forward-declared functions
main $@

















}