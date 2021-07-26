RTMPurl=""  # e.g. rtmp://stream.ystv.co.uk/....
SRTurl=""   # e.g. srt://stream.ystv.co.uk/....

for((;;)); do \
    ffmpeg -re -i "$RTMPurl" \
    -c copy \
    -f mpegts "$SRTurl/$1"; \
    sleep 1; \
done
