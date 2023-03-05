#!/bin/bash
source /opt/bashbase.sh

# Define the following in subscripts:

COMMAND_LIST += [
  "configure"   "Configure the dependencies and environment to enable a build by way of the \`build\` command or a development environment."
  "build"       "Compile and package the solution."
  "push"        "Push the package to the global repository."

  "pull"        "Pull a pre-built package."
  "install"     "Install to the system."
  "run"         "Launch the program."
  "stop"        "Stop the program."
  "monitor"     "Launch monitoring tools for the program."
]
