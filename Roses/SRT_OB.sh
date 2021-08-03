# 'OB STREAM SCRIPT' (Ob1 Version) - Run on OB units - roses21Streamer
homeSRT=""

read -p "OB Endpoint (e.g. football): " obEndpoint

while :; do
    ffmpeg -hide_banner -loglevel info \
-format_code Hi50 \
-f decklink -i 'DeckLink Mini Recorder'\
-c:v h264_nvenc \
-rc cbr_ld_hq \
-b_ref_mode:v middle \
-b:v 12.0M \
-bufsize: 480k \
-vf yadif \
-ar 44100 \
-f flv "$homeSRT/$obEndpoint"
    # \Change something here
done
