#!/bin/bash

log=plexPiInstaller.log
info="$(date +'%F %T.%N') [INFO] "
warn="$(date +'%F %T.%N') [WARN] "
error="$(date +'%F %T.%N') [ERROR] "

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
    ( # print script output to a .log file

        # Function to check the Return Code of an operation.
        # if operation fails, code!=0, then print an error
        # message and exit the script
        operationCheck(){
            if ! [[ $1 -ne 0 ]]; then
                echo $info $2
            else
                echo $error $3
                echo "An error has occured! Please check 'plexPiInstaller.log' for more info." >> /dev/tty
                exit 1
            fi
        }

        # # update packages installed
        # sudo apt-get update
        # operationCheck $? "updated installed packages." "failed to update installed packages."

        # # upgarde pakcages installed
        # sudo apt-get upgrade
        # operationCheck $? "upgraded installed packages." "failed to upgrade installed packages."

        # # install apt-transport-https package.
        # # allows apt to retrieve packages over https protocol that Plex uses
        # sudo apt-get install apt-transport-https
        # operationCheck $? "installing apt-transport-https package to allow apt to retrieve packages over https protocol that Plex uses." "failed to install apt-transport-https package."

        # # add the Plex repositories to the apt keyrings directory.
        # # this key is used to ensure the files that you are downloading are in fact from that repository and signed by that key
        # curl https://downloads.plex.tv/plex-keys/PlexSign.key | gpg --dearmor | sudo tee /usr/share/keyrings/plex-archive-keyring.gpg >/dev/null
        # operationCheck $? "added the Plex repositories to the apt keyrings directory." "failed to add the Plex repositories to the apt keyrings directory."

        # # add the official plex repository to the sources list 
        # echo deb [signed-by=/usr/share/keyrings/plex-archive-keyring.gpg] https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
        # operationCheck $? "added the official plex repository to the sources list." "failed to add the official plex repository to the sources list."

        # # run update again to refresh the package list
        # sudo apt-get update
        # operationCheck $? "upgraded installed packages confirming https transport package installed correctly." "failed to update installed packages. if you get the error '/usr/lib/apt/methods/https could not be found', then the https transport package was not installed correctly."

        # # install plex server
        # sudo apt install plexmediaserver
        # operationCheck $? "installed the plexmediaserver package." "failed to install the plexmediaserver packaged."


        sudo pwd
        operationCheck 3 "pwd printed." "using the root user was not a success."




    ) >> $log 2>&1   # print script output to a .log file

fi