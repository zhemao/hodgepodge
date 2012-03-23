if [ -z $1 ]; then
	OUTFILE=desktop-recording-`date +%s`.avi
else
	OUTFILE=$1
fi

WIDTH=`xwininfo -root | grep Width | awk '{ print $2 }'`
HEIGHT=`xwininfo -root | grep Height | awk '{ print $2 }'`

ffmpeg -f x11grab -s ${WIDTH}x${HEIGHT} -i $DISPLAY $OUTFILE
