#!/bin/bash

# ------------------------------------------------------------------------------
# Description
# ------------------------------------------------------------------------------

# Provide user-friendly VOICES network management tool to connect a node to the VOICES network.


# ------------------------------------------------------------------------------
# Initialization
# ------------------------------------------------------------------------------

read -r -d '' HELP_TEXT <<'_HELP_TEXT'

voices <command> <args>

Commands:
  connect           Connect to the VOICES network.
  check-status      Check the VOICES network connection status.
  get-ip            Get the current IP address.

  register-service  Install the VOICES network client onto the system as a service which will start automatically.
  delete-service    Uninstall the VOICES network service.

  --help            Print this help information.
''
_HELP_TEXT


# ------------------------------------------------------------------------------
# Process Arguments
# ------------------------------------------------------------------------------

# Handle only the first command passed into the script
case $1 in

--help)
  echo $_HELP_TEXT
  ;;

connect)
  ;;

check-status)

  ;;

get-ip)

  ;;

register-service)

  ;;

delete-service)
  ;;

*)
  echo $_HELP_TEXT
  exit 1

esac;













# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------



# Read in options
OPT_FORMAT_OUTPUT=0
while getopts ":ht" opt; do
	case $opt in
		h)
			echo -e "$HELP_TEXT"
			exit 1
			;;
		t)
			OPT_FORMAT_OUTPUT=1
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
	esac
done






usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }

while getopts ":s:p:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
            ((s == 45 || s == 90)) || usage
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))





https://stackoverflow.com/questions/57051573/handling-named-arguments-in-bash


#!/bin/bash

deploy=false
uglify=false

while (( $# >= 1 )); do
    case $1 in
    --deploy) deploy=true;;
    --uglify) uglify=true;;
    *) break;
    esac;
    shift
done

echo "deploy: $deploy"
echo "uglify: $uglify"






https://stackoverflow.com/questions/57051573/handling-named-arguments-in-bash

While dealing with this I came up with the following. We encapsulate all the procedure inside a function that takes all the arguments given to the script. Then, it iterates over all the arguments and whenever it find one that starts with double hyphen --arg1 it assigns the following argument arg2 to a global variable with the name of the first argument arg1="arg2". Next, it shifts the arguments' positions until it finish with all arguments.

#------ arguments_test.sh ------
#!/bin/bash
pararser() {
    # Define default values
    name=${name:-"name_def"}
    lastName=${lastName:-"lastName_def"}

    # Assign the values given by the user
    while [ $# -gt 0 ]; do
        if [[ $1 == *"--"* ]]; then
            param="${1/--/}"
            declare -g $param="$2"
        fi
        shift
    done

}


pararser $@

echo "My name is " $name $lastName
In this way we can define default values if they are not passed.

$ arguments_test.sh
> My name is name_def lastName_def
$ arguments_test.sh --name Foo --lastName Bar
> My name is Foo Bar
Some references
The main procedure was found here.
More about passing all the arguments to a function here.
More info regarding default values here.
More info about declare do $ bash -c "help declare".
More info about shift do $ bash -c "help shift".






















