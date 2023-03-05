#!/bin/bash

# Usage:
# 1. Inherit this script: `source /opt/bashbase.sh`
# 2. Define the following items:
#     DESCRIPTION: Script description.
#     COMMAND_LIST: Command names and help description.
#     All specialized environment variables needed by a particular superclass.
# . Implement functions with matching the command names.
# . Call main at the end of your script: `main $@`

# Define a set of command names
COMMAND_LIST=[
  help "Print this help information."
]


main() {

  # Enforce that all commands exist
  for COMMAND in COMMAND_LIST; do
    if [[ ! $(type -t $COMMAND[0]) == "function" ]]; then
      echo "Command $COMMAND does not exist - ensure a function with this name is defined."
      exit 1
    fi
  done

  # Call the relevant function
  shift
  $1 $@
  exit 0
}


print_help() {
  printf "%s\n" "$0 <command> <args>"
  printf "\n"
  printf "%s\n" $DESCRIPTION
  printf "\n"
  printf "Commands:"

  for COMMAND in COMMAND_LIST; do
    printf "%s\t\t%s\n" "COMMAND[0]" "COMMAND[1]"
  done
}
