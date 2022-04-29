#!/bin/bash
#using the path WALLPAPERS will select a new random wallpaper
WALLPAPERS=~/.config/awesome/themes/jerms-red/wallpaper
WALLPAPERSVERT=~/.config/awesome/themes/jerms-red/wallpaper
RANGE=$(ls $WALLPAPERS | wc -l)
RANGEVERT=$(ls $WALLPAPERSVERT | wc -l)

for i in 12; do
  let "number = $RANDOM % $RANGEVERT"
  IMAGEVERT=$(ls $WALLPAPERSVERT | head -$number | tail -1 )
  sed -i $i' c\file='"$WALLPAPERSVERT/$IMAGEVERT"'' ~/.config/nitrogen/bg-saved.cfg
done

for i in 2 7 17; do
  let "number = $RANDOM % $RANGE"
  IMAGE=$(ls $WALLPAPERS | head -$number | tail -1 )
  sed -i $i' c\file='"$WALLPAPERS/$IMAGE"'' ~/.config/nitrogen/bg-saved.cfg
done

nitrogen --restore
