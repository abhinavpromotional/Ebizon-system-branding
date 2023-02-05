#!/bin/bash

Location=$(pwd)

# Set the image as the wallpaper
echo "Applying EbizON Wallpaper..."
gsettings set org.gnome.desktop.background picture-uri "file://$Location/ebizon-wallpaper.png"
echo "EbizON Wallpaper is Successfully Changed..."

sudo su << EOF

# Check if package is installed
  if dpkg -s libglib2.0-dev-bin &> /dev/null; then
    echo "Package libglib2.0-dev-bin is already installed."
  else
    echo "Package libglib2.0-dev-bin is not installed."
    echo "Installing package libglib2.0-dev-bin..."
    sudo apt-get update
    sudo apt-get install -y libglib2.0-dev-bin
    echo "libglib2.0-dev-bin Package is Successfully Installed"
  fi

#Boot Screen Logos

echo "Applying EbizON Logos..."
mv /usr/share/plymouth/themes/spinner/watermark.png /usr/share/plymouth/themes/spinner/watermark-original.png
mv /usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo-original.png
cp $Location/watermark.png /usr/share/plymouth/themes/spinner/
cp $Location/ubuntu-logo.png /usr/share/plymouth/
echo "EbizON Logos are Successfully Changed..."

#LockScreen

echo "Downloading required .TAR.GZ file"
wget https://github.com/PRATAP-KUMAR/ubuntu-gdm-set-background/archive/main.tar.gz
echo "Extracting .TAR.GZ file"
tar -xvzf main.tar.gz
echo "Applying EbizON LockScreen..."
bash $Location/ubuntu-gdm-set-background-main/ubuntu-gdm-set-background --gradient horizontal \#454345 \#faca48
echo "EbizON LockScreen is Successfully Changed..."

echo "Removing All Extra Files..."
rm -rf main.tar.gz ubuntu-gdm-set-background-main


EOF

echo "---- EbizON Branding Is Now Applied On This System ----"
