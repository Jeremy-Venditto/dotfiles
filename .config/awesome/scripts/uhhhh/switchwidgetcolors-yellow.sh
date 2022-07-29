#!/bin/sh/

# Change logout-popup-widget color

cd ~/.config/awesome/widgets/logout-popup-widget 
rm logout-popup.lua 
cd power-yellow 
cp logout-popup.lua 
~/.config/awesome/widgets/logout-pop-up-widget


# Change Awesome Icon color / Taglist / Theme Layouts / CPU color

cd ~/.config/awesome/themes/computerjerms/
rm theme.lua 
cd yellow 
cp theme.lua ~/.config/awesome/themes/computerjerms


# Change Volume Icon color (awesome-wm-widgets)

cd ~/.config/awesome/widgets/volume-widget/icons 
rm audio-volume-high-symbolic.svg 
rm audio-volume-low-symbolic.svg 
rm audio-volume-medium-symbolic.svg 
rm audio-volume-muted-symbolic.svg 
cd yellow
cp audio-volume-high-symbolic.svg ~/.config/awesome/widgets/volume-widget/icons 
cp audio-volume-high-symbolic.svg ~/.config/awesome/widgets/volume-widget/icons
cp audio-volume-low-symbolic.svg ~/.config/awesome/widgets/volume-widget/icons
cp audio-volume-medium-symbolic.svg ~/.config/awesome/widgets/volume-widget/icons
cp audio-volume-muted-symbolic.svg~/.config/awesome/widgets/volume-widget/icons

