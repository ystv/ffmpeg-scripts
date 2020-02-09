#!/bin/bash
echo "NvEnc based livestreamer and recorder"
mkdir -p Recordings
filename=$(date +'%Y-%m-%d_%H:%M:%S')
echo "Starting event: $filename"
ffmpeg \
	-hide_banner \
	-loglevel info \
\
	-format_code Hi50 -f decklink -i 'DeckLink Mini Recorder'\
\
	-c:v h264_nvenc \
	-rc cbr_ld_hq \
	-b_ref_mode:v middle \
	-b:v 12.0M \
	-bufsize: 480k \
	-vf yadif \
\
	-ar 44100 \
\
	-f flv $rtmpServer \
\
	-vcodec prores \
	-acodec copy \
	 "Recordings/${filename}.mov"
