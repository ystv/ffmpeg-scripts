#!/bin/bash

# DEFAULTS
rtmpServer="" # Set to default location

echo "NvEnc based livestreamer and recorder"
mkdir -p Recordings
filename=$(date +'%Y-%m-%d_%H:%M:%S')

while [[ $# -gt 0 ]]; do
  case "$1" in
        -h|--help)
                echo "[./stream-nvenc.sh -r] to enable recording"
		echo "[./stream-nvenc.sh {stream}] to stream to $rtmpServer/{stream}]"
                exit 0
                ;;
        -r)
                toFile="-vcodec pores -acodec copy "'"'"Recordings/${filename}.mov"'"'""
                shift
                ;;
        *)
                rtmpServer+="/$1"
                break
                ;;
  esac
done

echo " Server: $rtmpServer"
echo " Starting event: $filename"

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
	$toFile
