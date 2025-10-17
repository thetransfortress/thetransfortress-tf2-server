#!/bin/sh
exec ./srcds_run -console -game tf -port 40002 -tv_port 40003 +sv_pure 1 +map koth_product_final +maxplayers 24 -autoupdate -steam_dir /home/$USER/steamcmd/ -steamcmd_script /home/$USER/thetransfortress-tf2-server/update-server-script.txt +sv_setsteamaccount $GAMESERVERLOGINTOKEN
