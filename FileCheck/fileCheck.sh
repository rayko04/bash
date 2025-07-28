#!/usr/bin/env bash


file() {

    if [[ $# -ne 1 ]]; then
        echo "Usage: file [file_name]"
        exit 1
    fi

    if [[ -f $1 ]]; then

        if [[ -r $1 && -w $1 ]]; then
            echo "$1 is readable and writeable."
        elif [[ -w $1 ]]; then
            echo "$1 is writeable."
        elif [[ -r $1 ]]; then
            echo "$1 is readable."
        else
            echo "$1 is neither readable nor writeable."
        fi   
    else
        echo "$1 does not exist."
    fi
}
