#!/bin/bash
ffmpeg  -format_code Hi50 -f decklink -i 'DeckLink Mini Recorder' \
        -vf yadif -vcodec libx264 -preset ultrafast -tune zerolatency  -crf 20 $
        -c:a copy -c:v copy -r 25 output.avi
