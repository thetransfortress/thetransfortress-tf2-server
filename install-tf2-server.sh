#!/bin/sh

# Install 32x libs
sudo dpkg --add-architecture i386
sudo apt update
sudo apt -y upgrade
sudo apt -y install libc6:i386 libncurses6:i386 libstdc++6:i386 zlib1g:i386 libbz2-1.0:i386 libcurl3t64-gnutls:i386 libsdl2-2.0-0:i386 xorg

# Install Steam
sudo apt install steam-installer
steam-installer
nohup steam &

# Instal SteamCMD
mkdir ~/steamcmd
cd ~/steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar zxf steamcmd_linux.tar.gz
./steamcmd.sh +force_install_dir /home/$USER/tf2-ds +login anonymous +app_update 232250 +quit