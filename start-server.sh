#!/bin/sh
exec ./srcds_run -console -game tf -port 27015 -tv_port 27020 +sv_pure 1 +map koth_product_final +maxplayers 24 -autoupdate -steam_dir /home/$USER/.steam/steamcmd/ -steamcmd_script /home/$USER/thetransfortress-tf2-server/update-server-script.txt +sv_setsteamaccount $GAMESERVERLOGINTOKEN
