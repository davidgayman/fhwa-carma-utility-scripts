#!/bin/bash


# ------------------------------------------------------------------------------
# Description
# ------------------------------------------------------------------------------

# Usage:
# 1. Inherit this script: `source /opt/bashbase.sh`
# 2. Define the following items:
#     DESCRIPTION: Script description.
#     COMMAND_LIST: Command names and help description.
#     All specialized environment variables needed by a particular superclass.
# . Implement functions with matching the command names.
# . Call main at the end of your script: `main $@`


# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------

# Define a set of commands
COMMAND_LIST=[
  help "Print this help information."
]

# Define a set of sub-commands
SUBCOMMAND_LIST=[
  all "Run the command on all subcommands."
]


# ------------------------------------------------------------------------------
# Process Arguments
# ------------------------------------------------------------------------------


main() {

  # Enforce that all commands exist
  for COMMAND in COMMAND_LIST; do
    if [[ ! $(type -t $COMMAND[0]) == "function" ]]; then
      echo "Command $COMMAND does not exist - ensure a function with this name is defined."
      exit 1
    fi
  done
  for COMMAND in SUBCOMMAND_LIST; do
    if [[ ! $(type -t $COMMAND[0]) == "function" ]]; then
      echo "Sub-command $COMMAND does not exist - ensure a script with this name is defined."
      exit 1
    fi
  done

  # Call the relevant operation
  shift
  $1 $@
  exit 0
}


# ------------------------------------------------------------------------------
# Standard Functions
# ------------------------------------------------------------------------------

all() {
  # Execute the command for all subcommands
  for COMMAND in SUBCOMMAND_LIST; do
    ${COMMAND}[0] $@
  done
}

print_help() {
  printf "%s\n" "$0 <command> <args>"
  printf "%s\n" "$0 <sub-command> <command> <args>": Passes control to the subcommand.
  printf "\n"
  printf "%s\n" $DESCRIPTION
  printf "\n"
  printf "Commands:"

  for COMMAND in COMMAND_LIST; do
    printf "%s\t\t%s\n" "COMMAND[0]" "COMMAND[1]"
  done

  printf "Sub-commands:"
  for COMMAND in SUBCOMMAND_LIST; do
    printf "%s\t\t%s\n" "COMMAND[0]" "COMMAND[1]"
  done
}
