FROM ubuntu:22.04

RUN apt update && apt install -y curl xz-utils
WORKDIR /tmp
RUN \
curl -LO https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz && \
tar -xf ffmpeg-master-latest-linux64-gpl.tar.xz && \
mv ffmpeg-master-latest-linux64-gpl/bin/* /usr/bin/
