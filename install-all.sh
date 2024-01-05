#!/bin/bash

# install i3
# i3blocks      - for better status bar
# feh           - for background (wallpaper) support
# font-awesome  - for icons in the status bar
# kbdd          - for making the keyboard layout indicator work
# ranger        - for file browsing, because nautilus is bad
# rofi          - as an alternative better application launcher
# arandr        - screens layout application
sudo apt-get install i3 i3blocks feh fonts-font-awesome kbdd rofi arandr dunst -y

# install a commnd line file manager and different packages to work with different files
sudo apt-get install ranger caca-utils highlight atool w3m poppler-utils mediainfo -y

# for cool locking screen
sudo apt-get install scrot imagemagick 

# fetch the submodules
git submodule init
git submodule update

# install powerline fonts
patches/powerline/install.sh
fc-cache -vf

# install stow 
sudo apt-get install stow -y

# stow all configurations (create soft links where needed)
for MODULE in "i3" "zsh" "ranger" "rofi" "dunst"
do
    stow $MODULE
done

# setup a cronjob for battery notification

# write current crontab
crontab -l | grep -v "no crontab for"> /tmp/mycron
#echo new cron into cron file
echo "*/5 * * * * ${HOME}/.i3/bin/verify-battery" >> /tmp/mycron
#install new cron file
crontab /tmp/mycron
rm /tmp/mycron
