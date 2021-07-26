# $1 = Event name (input)               e.g. rowing
# $2 = Rtmp internal event (with pwd)   e.g. rowing?pwd=....
# $3 = LA1 stream key                   e.g. latv=... SOMETHING ELSE???

head ./loopscript.sh -n 3; echo -e "----------------------------\n\n"

[[ -z $1 || -z $2 || -z $3 ]] && { echo "Parameters missing - exiting"; exit 1; }

AddressSRT="" # SRT stream  e.g. srt://stream.ystv.co.uk.../$1
AddressA=""   # LA1 stream  e.g. rtmp://stream1.la1tv.co.uk.../$3
AddressB=""   # YSTV stream e.g. rtmp://stream.ystv.co.uk.../$2

while :; do
    ffmpeg -re -i "$AddressSRT" \
    -c copy -f flv "$AddressA" -c copy -f flv "$AddressB"
    sleep 1
done
