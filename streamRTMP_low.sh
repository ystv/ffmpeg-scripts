#!/bin/bash
ffmpeg \
-format_code Hi50 \
-f decklink \
-i 'DeckLink Mini Recorder' \
-vf yadif \
-vcodec libx264 \
-preset ultrafast \
-tune zerolatency \
-crf 20 \
-maxrate 10000k \
-bufsize 1000 \
-g 250 \
-f flv \
$rtmpServer
