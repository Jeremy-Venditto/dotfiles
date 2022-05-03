#!/bin/bash

function MAIN {
echo 'What would you like to configure?'
PS3='Please enter your choice: '
options=("Everything" "Home Folder" "Packages" "AweosmeWM" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Everything")
            echo "you chose choice 1"
            break
            ;;
        "Home Folder")
            echo "you chose choice 2"
            break
            ;;
        "Packages")
            echo "you chose choice 3"
            break
            ;;
        "AwesomeWM")
            echo "you chose choice $REPLY which is $opt"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

MAIN
