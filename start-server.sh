#!/bin/sh
exec ./srcds_run -console -game tf -port 40002 -tv_port 40003 +sv_pure 1 +map koth_product_final +maxplayers 24 -autoupdate -steam_dir /home/$USER/.steam/steamcmd/ -steamcmd_script ./update-server-script.txt +sv_setsteamaccount $GAMESERVERLOGINTOKEN
