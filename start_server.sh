#!/bin/sh
exec ./srcds_run -console -game tf +sv_pure 1 +map koth_product_final +maxplayers 24 +sv_setsteamaccount $GAMESERVERLOGINTOKEN -autoupdate -steam_dir /home/$USER/steamcmd/ -steamcmd_script ./update-script.txt
