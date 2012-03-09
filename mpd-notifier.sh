mpc idleloop player | while read event
do
	notify-send "`mpc status`"
done
