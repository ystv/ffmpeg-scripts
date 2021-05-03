homeSRT="rtmp://stream.ystv.co.uk/"
homeFolder="/mnt/roses"

# e.g. run  "./rec.sh la1tv/rowing"
[[ -z $1 ]] && streamName="ystv/tennis" || streamName="$1"

# Make sure the folder exists, if not make it
[[ -d "$homeFolder/ystv ]] || mkdir "$homeFolder/ystv"
[[ -d "$homeFolder/la1tv ]] || mkdir "$homeFolder/la1tv"

while :; do
    curTime=$(date +"%s")
    ffmpeg -i "$homeSRT$streamName" -c copy -f mp4 "/mnt/roses/$streamName-$curTime.mkv"
    sleep 1
done
