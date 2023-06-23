#!/bin/bash

BGGreen='\033[0;42m'
BGRED='\033[0;41m'
Yellow='\033[0;33m' # Yellow color
GREEN='\033[0;32m'  # Green color
RED='\033[0;31m'    # Red color
NC='\033[0m'        # No color (default)

User=$(whoami)
Location=$(pwd)
cp $Location/ebizon-wallpaper.png /home/$User/
wget -q https://raw.githubusercontent.com/PRATAP-KUMAR/ubuntu-gdm-set-background/main/ubuntu-gdm-set-background && chmod +x ubuntu-gdm-set-background
curl -fL 'https://raw.githubusercontent.com/PRATAP-KUMAR/ubuntu-gdm-set-background/main/ubuntu-gdm-set-background' -o ubuntu-gdm-set-background && chmod +x ubuntu-gdm-set-background

# Set the image as the wallpaper
echo -e "${BGGreen} Applying EbizON Wallpaper... ${NC} \n"

gsettings set org.gnome.desktop.background picture-uri "file:///home/$User/ebizon-wallpaper.png"

echo -e "${BGGreen} EbizON Wallpaper is Successfully Changed... ${NC} \n"


sudo su << EOF

# Check if package is installed
  if dpkg -s libglib2.0-dev-bin &> /dev/null; then
    echo -e "${BGGreen} Package libglib2.0-dev-bin is already installed. ${NC} \n"
  else
    echo -e "${RED} Package libglib2.0-dev-bin is not installed. ${NC} \n"
    echo -e "${BGGreen} Installing package libglib2.0-dev-bin... ${NC} \n"
    sudo apt-get update
    sudo apt-get install -y libglib2.0-dev-bin
    echo -e "${BGGreen} libglib2.0-dev-bin Package is Successfully Installed ${NC} \n"
  fi

#Boot Screen Logos

echo -e "${BGGreen} Applying EbizON Logos... ${NC} \n"
mv /usr/share/plymouth/themes/spinner/watermark.png /usr/share/plymouth/themes/spinner/watermark-original.png
mv /usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo-original.png
cp $Location/watermark.png /usr/share/plymouth/themes/spinner/
cp $Location/ubuntu-logo.png /usr/share/plymouth/
cp $Location/ebizon-wallpaper.png /usr/share/backgrounds
echo -e "${BGGreen} EbizON Logos are Successfully Changed... ${NC} \n"

#LockScreen

echo -e "${BGGreen} Downloading required .TAR.GZ file ${NC} \n"
wget https://github.com/PRATAP-KUMAR/ubuntu-gdm-set-background/archive/main.tar.gz
echo "${BGGreen} Extracting .TAR.GZ file ${NC} \n"
tar -xvzf main.tar.gz
echo -e "${BGGreen} Applying EbizON LockScreen... ${NC} \n"
bash $Location/ubuntu-gdm-set-background-main/ubuntu-gdm-set-background --gradient horizontal \#454345 \#faca48
echo -e "${BGGreen} EbizON LockScreen is Successfully Changed... ${NC} \n"

echo -e "${BGGreen} Removing All Extra Files... ${NC} \n"
rm -rf main.tar.gz ubuntu-gdm-set-background-main


EOF

rm -rf $Location/ebizon-wallpaper.png
rm -rf $Location/ubuntu-gdm-set-background
rm -rf $Location/ubuntu-logo.png
rm -rf $Location/watermark.png
rm -rf $Location/Uninstall-Ebizon-Branding.sh

echo -e "${BGGreen} ---- EbizON Branding Is Now Applied On This System ---- ${NC}"
