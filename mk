#!/usr/bin/bash

# mk -- simple script for creating a template file in cwd.

# globals
TEMPLATES_DIR="/c/Users/frazao/bin/static/mk"


# functions

usage() {
    echo "usage: mk (sh) FILEPATH ['DESCRIPTION']"
}

# main: parse arguments subcommand , positional and options
{
    script=$(basename $0)

    if [[ -z $1 || -z $2 ]]
    then
        echo "$script: must provide template and file path" >&2
        usage
        exit 1
    else
        # Get required sub-command
        subcommand=$1       # sub-commands available correspond to templates
        
        # Get required destination file
        filepath=$2
        filename=$(basename $filepath)

        # Get optional description
        description=${3:-DESCRIPTION}
    fi

    case $subcommand in
        sh)
            # Get bash template and substitute <COMMAND> for file name and <DESCRIPTION> for the one given, if provided
            cat $TEMPLATES_DIR/bash_template.sh |
                sed "s|<COMMAND>|$filename|g"   |
                sed "s|<DESCRIPTION>|$description|g" > $filepath # TODO: ask for a description instead
            chmod u+x $filepath
        ;;
        *)
            echo "$script: invalid type" >&2
            usage
        ;;
    esac
}