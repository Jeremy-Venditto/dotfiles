#!/bin/bash

WALLPAPERS=~/.config/awesome/themes/jerms-red/wallpaper/1920x1080
RANGE=$(ls $WALLPAPERS | wc -l)
WALLPAPERSVERT=~/.config/awesome/themes/jerms-red/wallpaper/1080x1920
RANGEVERT=$(ls $WALLPAPERSVERT | wc -l)

function main_monitor () {
for i in 7 ; do
  let "number = $RANDOM % $RANGE"
  IMAGE=$(ls $WALLPAPERS | head -$number | tail -1 )
  sed -i $i' c\file='"$WALLPAPERS/$IMAGE"'' ~/.config/nitrogen/bg-saved.cfg
done
 }

function left_monitor () {
for i in 17; do
  let "number = $RANDOM % $RANGE"
  IMAGE=$(ls $WALLPAPERS | head -$number | tail -1 )
  sed -i $i' c\file='"$WALLPAPERS/$IMAGE"'' ~/.config/nitrogen/bg-saved.cfg
done
 }

function right_monitor () {
for i in 12; do
  let "number = $RANDOM % $RANGEVERT"
  IMAGEVERT=$(ls $WALLPAPERSVERT | head -$number | tail -1 )
  sed -i $i' c\file='"$WALLPAPERSVERT/$IMAGEVERT"'' ~/.config/nitrogen/bg-saved.cfg
done
 }

function set_main_monitor () {
main_monitor
nitrogen --restore
#sleep 180
}

function set_left_monitor () {
left_monitor
nitrogen --restore
#sleep 240
}

function set_right_monitor () {
right_monitor
nitrogen --restore
#sleep 190
}

function set_monitors () {
set_main_monitor 
set_left_monitor
set_right_monitor
}


#while true
#do
set_monitors
pkill nitrogen
#done
