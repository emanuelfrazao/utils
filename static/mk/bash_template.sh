#!/usr/bin/bash

# <COMMAND>: <DESCRIPTION>

# Note that description in $desc will be used directly in usage info
desc=$(cat<<EOF
description: <DESCRIPTION>

options:
    -h      to see the help message
EOF
)

# globals
    # exiting
trap "exit 1" TERM
export TOP_PID=$$

    # utils
LOG_DIR=$(dirname $0)
SCRIPT_BASENAME=$(basename $0)

# functions
    # utils
usage() {
    echo "usage: <COMMAND> [-h] ..."
}

help() {
    usage
    echo $desc
}

# main
{
    while getopts ":h" OPT
    do
        case $OPT in
            # Options


            # Help
            h)
            help
            ;;
            # Invalid option
            *)
            echo "$(basename $0): invalid command" >&2
            usage
            ;;
        esac
    done
}

exit 0