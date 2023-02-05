#!/bin/bash

Location=$(pwd)

# Set the image as the wallpaper
echo "Changing Wallpaper to Default..."
gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/warty-final-ubuntu.png"

sudo su << EOF

echo "Changing Logos to Default..."
mv /usr/share/plymouth/themes/spinner/watermark-original.png /usr/share/plymouth/themes/spinner/watermark.png
mv /usr/share/plymouth/ubuntu-logo-original.png /usr/share/plymouth/ubuntu-logo.png

wget https://github.com/PRATAP-KUMAR/ubuntu-gdm-set-background/archive/main.tar.gz
tar -xvzf main.tar.gz
echo "Changing LockScreen Background To Default"
bash $Location/ubuntu-gdm-set-background-main/ubuntu-gdm-set-background --reset

echo "Removing All Extra Files..."
rm -rf main.tar.gz ubuntu-gdm-set-background-main

EOF

echo "---- EbizON Branding Is Now Removed from This System ----"
