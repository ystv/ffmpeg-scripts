# 'FORWARDER SCRIPT' - RUN ON SPEED
# Application path (this would be the URL path of the application in OBS this would be everything after the domain)
appPath=""
# Endpoint so something like rtmp://example.com:1935
rtmpEndpoint=""

homeIn="rtmp://stream.ystv.co.uk"
homeOut="rtmp://stream.ystv.co.uk/internal/mixer"               # CHANGE TO PROPER ADDRESS

read -p "OB Pull point (e.g. mix/running): " obPullPoint
read -p "LA1TV Play Path (e.g. ob1): " laPlayPath

echo "If you want to record the stream, make sure you run ./roses21Recorder (in a tmux window or something)"

while :; do
    ffmpeg -re -i "$homeIn/$obPullPoint" \
-c copy -f flv -rtmp_flashver "flashver=FMLE/3.0\20(compatible;\20FMSc/1.0)" \
-rtmp_playpath "$laPlayPath" \
-rtmp_app "$appPath" \
"rtmp://$rtmpEndpoint"

    echo "Stream disconnected - trying again in 1 second"
    sleep 1
done
