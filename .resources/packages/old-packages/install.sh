#!/bin/bash
echo;echo 'Install Packages for:'
PS3='Please enter your choice: '
options=("Desktop" "Laptop" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Desktop")
            sudo pacman -S - < pacman.txt
            sudo pacman -S - < desktop.txt
            git clone https://aur.archlinux.org/yay
            cd yay && makepkg -Si
            yay -S - < aur.txt
            break
            ;;
        "Laptop")
            sudo pacman -S - < pacman.txt
            sudo pacman -S - < laptop.txt
            git clone https://aur.archlinux.org/yay
            cd yay && makepkg -Si
            yay -S - < aur.txt
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
