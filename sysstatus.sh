BATTERY=`acpi -b | cut -d " " -f 4`

if [ "`acpi -a | grep on-line`" ]; then
	CHARGING='charging'
else
	CHARGING='discharging'
fi

DATE=`date "+%F %r"`

VOLLINE=`amixer get Master | grep "^\\s*Front Left"`

if [ "`echo $VOLLINE | grep "\[on\]"`" ]; then
	VOLUME=`echo $VOLLINE | sed -e "s/\].*//" -e "s/.*\[//"`
else
	VOLUME='muted'
fi

if [ "`mpc status | grep "\[playing\]"`" ]; then
	MPDSTAT=`mpc current`
else
	MPDSTAT='PAUSED'
fi

echo "$MPDSTAT | Battery: $BATTERY $CHARGING | Volume: $VOLUME | $DATE"
