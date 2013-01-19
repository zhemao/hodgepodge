#!/bin/sh

AUDIO_BACKEND=default
VIDEO_DEVICE=/dev/video0

AUDIO_CODEC=flac
VIDEO_CODEC=libvpx

AUDIO_CONTAINER=ogg
VIDEO_CONTAINER=webm

VIDEO_SIZE="800x600"

if [ -f ~/.ffrecordrc ]; then
    source ~/.ffrecordrc
fi

case $1 in 
    -audio)
        ffmpeg -f alsa -i $AUDIO_BACKEND -acodec $AUDIO_CODEC \
            audio-`date +%s`.$AUDIO_CONTAINER ;;
    -video)
        ffmpeg -f alsa -i $AUDIO_BACKEND -acodec $AUDIO_CODEC \
            -f v4l2 -i $VIDEO_DEVICE -vcodec $VIDEO_CODEC -s $VIDEO_SIZE \
            video-`date +%s`.$VIDEO_CONTAINER ;;
    -image)
        ffmpeg -f v4l2 -i $VIDEO_DEVICE -s $VIDEO_SIZE image-`date +%s`.jpg ;;
    *) 
        echo "Usage: $0 -audio|-video|-image"
        exit 1 ;;
esac
