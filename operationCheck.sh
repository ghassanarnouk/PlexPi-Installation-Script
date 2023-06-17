#!/bin/bash

# Function to check the Return Code of an operation.
# if operation fails, code!=0, then print an error
# message and exit the script
operationCheck(){
    if ! [ $1 -ne 0 ]; then
        echo $info $2
    else
        echo $error $3
        echo "An ERROR has occured! Please check 'plexPiInstaller.log' for more info." >> /dev/tty
        exit 1
    fi
}