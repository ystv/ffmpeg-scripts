# Basic stream to rtmp code
~/bin/ffmpeg \
-format_code Hi50 \
-f decklink \
-i 'DeckLink Mini Recorder' \
-c:v h264_nvenc \
-preset fast \
-pixel_format yuv420p \
-vf yadif \
-c:a aac \
-b:v 6M \
-b:a 320k \
-rtbufsize 8000 \
-f flv \
$rtmpServer #-c:v h264 -c:a aac -f mp4 test_$1.mp4
