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
  #
  dpkg --force-overwrite -i
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
  # Determine if
}

print_help() {
cat <<'_HELP_TEXT'

voices <command> <args>

Commands:


  register-tena-commands
  start-console
  env-load
  start-em          Start the TENA Execution Manager.

  doc               d

  d              d.
  d              d.
  d              d.
  d              d.
  d              d.
  d              d.

  help              Print this help information.

_HELP_TEXT
}


# ------------------------------------------------------------------------------
# Run
# ------------------------------------------------------------------------------

# Execute the script with forward-declared functions
main $@

















}