#!/bin/bash

# ------------------------------------------------------------------------------
# Description
# ------------------------------------------------------------------------------

CARLA utility script for common Python setup functionality.

# Reference
# - [Rendering toggle](https://carla.readthedocs.io/en/latest/adv_rendering_options/#off-screen-mode)
# - [Headless mode](https://carla.readthedocs.io/en/0.9.5/carla_headless/)

# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------

VENV_ROOT=$HOME/.venv
DEFAULT_VENV_NAME="carla"
CARLA_ROOT=$HOME/carla

# ------------------------------------------------------------------------------
# Process Arguments
# ------------------------------------------------------------------------------

main() {

  # Handle only the first command passed into the script
  case $1 in

    mkvenv) mkvenv;;
    venv) venv;;

    start) start-carla;;

    help) print_help;;
    --help) print_help;;
    *) print_help;;

  esac;

  # Exit with code
  exit 0
}


# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

mkvenv() {
  mkdir $VENV_ROOT
  VENV_NAME=$DEFAULT_VENV_NAME
  echo "[-] Making Python virtual environment \"$VENV_NAME\""
  python3 -m venv $VENV_ROOT/$VENV_NAME
  echo "[-] Configuring virtual environment: Installing requirements"
  source $VENV_ROOT/$VENV_NAME/bin/activate
  pip3 install --upgrade pip wheel
  python3 -m pip install -r requirements.txt

  echo "[-] Configuring virtual environment: Installing local CARLA .egg file"
  CARLA_EGG_FILE=$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.14-py3.7-linux-x86_64.egg
  python3 install-egg.py $CARLA_EGG_FILE

  deactivate
}

venv() {
  VENV_NAME=$DEFAULT_VENV_NAME
  echo "[-] Activating Python virtual environment"
  source $VENV_ROOT/$VENV_NAME/bin/activate
  echo "source $VENV_ROOT/$VENV_NAME/bin/activate"
}

set-rendering-level() {
  echo "Not implemented"
}

start-carla() {
  $CARLA_ROOT/CarlaUE4.sh -carla-server -ResX 200 -ResY 100 -fps 10 -RenderOffscreen
}

print_help() {
cat <<'_HELP_TEXT'

ccarla <command> <args>

CARLA configuration utility.

Commands:

  mkvenv <name>     Make a named Python virtual environment containing CARLA and related dependencies.
  venv <name>       Load the Python virtual environment.

  start             Start CARLA.

  help              Print this help information.

_HELP_TEXT
}


# ------------------------------------------------------------------------------
# Run
# ------------------------------------------------------------------------------

# Execute the script with forward-declared functions
main $@
