# ffmpeg-scripts
FFmpeg scripts used by YSTV

[stream.sh](stream.sh)  
Used during live drama, better low latency performance but heavier load on the streaming computer.

[stream-low.sh](stream-low.sh)  
Script that is currently used for livestreaming, made quickly so not very optimised.

[stream-rec.sh](stream-rec.sh)  
Script based on stream-low that also dumps the raw video stream to an .avi file.

[stream-nvenc.sh](stream-nvenc.sh)  
Uses GPU encoding to stream to an RTMP endpoint and store a copy of the stream in ProRes inside a folder called "Recordings", name is based on the time the stream started.
