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
    # Define the menu options
    options=("Install Plex Media Server" "Check Plex Server Status" "Restart Plex Server" "Quit")

    # Display the menu and prompt for selection
    select option in "${options[@]}"
    do
    case $option in
        "Install Plex Media Server")
        echo "You selected Install Plex Media Server"

        ( # print script output to a .log file

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
            # operationCheck $? "upgraded installed packages confirming https transport package installed correctly." "failed to update installed packages! If you get the error '/usr/lib/apt/methods/https could not be found', then the https transport package was not installed correctly."

            # # install plex server
            # sudo apt install plexmediaserver
            # operationCheck $? "installed the plexmediaserver package." "failed to install the plexmediaserver packaged."


            # sudo chmod 777 /media
            # operationCheck $? "changed the permission of the /media directory to 777." "failed to change the permission of the /media directory to 777! This could be due to not being able to run the chmod command as the root user."

            # ip=$(hostname -I | cut -d " " -f 1)
            # operationCheck $? "obtained the ip address of the raspberry pi: $ip" "faield to obtain the correct ip address the raspberry pi and the collected ip address is: $ip"

            echo "commands go here"
            operationCheck 0 "things are working" "are not fine"
            operationCheck 3 "things are working" "are not fine"

        ) >> $log 2>&1   # print script output to a .log file
        ;;

        "Check Plex Server Status")
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

            systemctl status plexmediaserver.service | tee -a $log
            operationCheck $? "Obtained the status of the plexmediaserver.service." "failed to check the status of plexmediaserver.service."
            ;;

        "Restart Plex Server")
        # echo "You selected Restart Plex Server"
        # Add your code for Restart Plex Server here
        (
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

            # systemctl restart plexmediaserver.service
            echo "testing plexmediaserver.service"
            operationCheck $? "restarted plexmediaserver.service." "failed to restart plexmediaserver.service."

        ) >> $log 2>&1
        ;;

        "Quit")
        echo "Quitting..."
        break
        ;;

        *) # Handle invalid selections
        echo "Invalid option. Please choose a number from 1 to 4."
        ;;
    esac
    done
fi