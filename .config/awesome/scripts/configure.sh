#!/bin/bash

read -r -p "This script will edit various configurations on Awesome WM.. continue? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
 echo "Yes"
 ;;
    [nN][oO]|[nN])
 echo "No"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac


read -r -p "What would you like to configure? [1 2 3 4]" input

case $input in
    [1][2][3][4][q])
echo "noob"
;;
    [q]
echo "Quit"
exit 1
