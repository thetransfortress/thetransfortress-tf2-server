#!/bin/sh
exec ./srcds_run -console -game tf -port $SRCDS_PORT -tv_port $SRCDS_TV_PORT +sv_pure 1 +map koth_product_final +maxplayers 24 +sv_setsteamaccount $GAMESERVERLOGINTOKEN -autoupdate -steam_dir /home/$USER/.steam/steamcmd/ -steamcmd_script /home/$USER/thetransfortress-tf2-server/update-server-script.txt
