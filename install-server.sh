#!/bin/sh

# Install 32x libs
echo
echo "Updating apt..."
echo
sleep 2

sudo dpkg --add-architecture i386
sudo apt update

echo
echo "Installing 32-bit libraries..."
echo
sleep 2

sudo apt -y install libc6:i386 libncurses6:i386 libstdc++6:i386 zlib1g:i386 libbz2-1.0:i386 libcurl3t64-gnutls:i386 libsdl2-2.0-0:i386

# Install Steam
echo
echo "Downloading steam-installer..."
echo
sleep 2

sudo apt -y install steam-installer

echo
echo "Starting steam-installer, press \"Install\", then let Steam install and update.  You do not need to sign into Steam."
sleep 2

nohup steam >/dev/null 2>&1 &

# Install SteamCMD
echo
echo "Installing SteamCMD..."
echo
sleep 2

mkdir ~/steamcmd
cd ~/steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar zxf steamcmd_linux.tar.gz
rm steamcmd_linux.tar.gz

# Install TF2 Server
echo "Installing TF2 server..."
echo
sleep 2

./steamcmd.sh +force_install_dir /home/$USER/thetransfortress-tf2-server +login anonymous +app_update 232250 +quit

# Install Metamod, Sourcemod, and SrcTV+

cd /home/$USER/thetransfortress-tf2-server/tf

echo
echo "Downloading Metamod 2.0 and Sourcemod 1.13.0..."
echo
sleep 2

wget https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1366-linux.tar.gz
wget https://sm.alliedmods.net/smdrop/1.13/sourcemod-1.13.0-git7255-linux.tar.gz

echo "Extacting Metamod and Sourcemod..."
echo
sleep 2

tar zxf mmsource-2.0.0-git1366-linux.tar.gz
tar zxf sourcemod-1.13.0-git7255-linux.tar.gz

rm mmsource-2.0.0-git1366-linux.tar.gz
rm sourcemod-1.13.0-git7255-linux.tar.gz

cd addons

echo "Downloading SrcTV+..."
echo
sleep 2

wget https://github.com/dalegaard/srctvplus/releases/download/v3.0/srctvplus.vdf
wget https://github.com/dalegaard/srctvplus/releases/download/v3.0/srctvplus.so

cd /home/$USER/thetransfortress-tf2-server/tf/

# Disable unused plugins

echo "Disabling unused plugins..."
echo
sleep 2

mv addons/sourcemod/plugins/basevotes.smx addons/sourcemod/plugins/disabled/basevotes.smx
mv addons/sourcemod/plugins/funcommands.smx addons/sourcemod/plugins/disabled/funcommands.smx
mv addons/sourcemod/plugins/funvotes.smx addons/sourcemod/plugins/disabled/funvotes.smx
mv addons/sourcemod/plugins/nextmap.smx addons/sourcemod/plugins/disabled/nextmap.smx
mv addons/sourcemod/plugins/reservedslots.smx addons/sourcemod/plugins/disabled/reservedslots.smx

# chmod scripts

cd /home/$USER/thetransfortress-tf2-server/

chmod +x ./start-server.sh
chmod +x ./download-maps.sh

# Download maps

echo "Downloading maps..."
echo
sleep 2

./download-maps.sh

echo "Done!"
read -n1 -s