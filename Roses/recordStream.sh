#!/bin/bash
homeURL="rtmp://stream.ystv.co.uk/"
homeFolder="/mnt/roses"

# e.g. run  "./recordStream.sh la1tv/rowing"
[[ -n $1 ]] && streamName="$1" || { echo "Missing parameters - exiting"; exit 1; }

# Make sure the folder exists, if not make it
[[ -d "$homeFolder/ystv ]] || mkdir "$homeFolder/ystv"
[[ -d "$homeFolder/la1tv ]] || mkdir "$homeFolder/la1tv"

while :; do
    curTime=$(date +"%s")
    ffmpeg -i "$homeURL$streamName" -c copy -f mp4 "/mnt/roses/$streamName-$curTime.mkv"
    sleep 1
done
