#!/bin/bash

cp ~/.config/awesome/rc.lua ~/.config/awesome/scripts/switch-config/backup/ && rm ~/.config/awesome/rc.lua
cp ~/.config/awesome/scripts/switch-config/laptop/rc.lua ~/.config/awesome/
echo 'awesome.restart()' | awesome-client

echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Awesome WM has restarted and your changes should have taken effect.
echo   
echo A backup copy of your rc.lua has been placed in the current folder:
echo  
echo ~/.config/awesome/scripts/switch-config/backup
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
