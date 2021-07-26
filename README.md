# ffmpeg-scripts
FFmpeg scripts used by YSTV

[streamRTMP.sh](streamRTMP.sh)  
Used during live drama, better low latency performance but heavier load on the streaming computer.

[streamRTMP_low.sh](streamRTMP_low.sh)  
Script that is currently used for livestreaming, made quickly so not very optimised.

[streamRTMP_record.sh](streamRTMP_record.sh)  
Script based on stream-low that also dumps the raw video stream to an .avi file.

[streamRTMP_nvenc.sh](streamRTMP_nvenc.sh)  
Uses GPU encoding to stream to an RTMP endpoint and store a copy of the stream in ProRes inside a folder called "Recordings", name is based on the time the stream started.

-------

[Roses 2021 scripts](Roses/)  
Scripts used between york and la1 to send and receive RTMP streams.
