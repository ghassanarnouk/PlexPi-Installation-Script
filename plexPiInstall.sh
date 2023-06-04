#!/bin/bash

usage="Usage: sh plexPiInstall.sh [-h|--help]"

if [ $# -eq 1 ]; then
    if [ $1 = "-h" -o $1 = "--help" ]; then
        echo "PlexPiInstall:"
        echo "              "$usage
        echo ""
        exit 0
    else
        echo $usage
        echo ""
        exit 1
    fi
else
    echo "hello world"
fi

