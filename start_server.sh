#!/bin/sh
exec ./srcds_run -console -game tf +sv_pure 1 +map koth_product_final +maxplayers 24 +sv_setsteamaccount 6CC49A5EC1DFFBAADBC0522A974A9F3D -autoupdate -steam_dir /home/jeli/steamcmd_linux/ -steamcmd_script /home/jeli/tf2-ds/update.txt
