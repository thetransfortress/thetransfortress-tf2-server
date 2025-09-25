#!/bin/sh
MAPPOOL_FILE_PATH=`realpath ./tf/cfg/mappool.txt`
MAPS_DIR_PATH=`realpath ./tf/maps/`

while [ $# -gt "0" ]; do
    arg=$1
    shift
    
    case $arg in
        -p)
            if [ $# = 0 ]; then
                echo "Must specify a path after the -p flag."
                exit
            fi
            
            MAPPOOL_FILE_PATH=`realpath $1`
            shift
            ;;
        -m)
            if [ $# = 0 ]; then
                echo "Must specify a path after the -m flag."
                exit
            fi
            
            MAPS_DIR_PATH=`realpath $1`
            shift
            ;;
        *)
            echo "Unknown flag \"$arg\""
            exit
            ;;
    esac
done

if [ ! -d "$MAPS_DIR_PATH" ]; then
    echo "Missing maps directory: $MAPS_DIR_PATH"
    exit
fi

if [ ! -f "$MAPPOOL_FILE_PATH" ]; then
    echo "Missing mappool.txt file: $MAPPOOL_FILE_PATH"
    exit
fi

cd $MAPS_DIR_PATH

while read -r line; do
    if [ -f "./$line.bsp" ]; then
        echo "Map \"$line.bsp\" already exists, skipping..."
        else
            echo "Downloading map \"$line.bsp\"..."
            wget "https://fastdl.serveme.tf/maps/$line.bsp"
    fi
done < $MAPPOOL_FILE_PATH
