DATE=`date "+%F %I:%M %p"`

echo -n "$DATE"

if [ "`ls /sys/class/power_supply`" ]; then
	BATTERY=`acpi -b | cut -d " " -f 4`
	if [ "`acpi -a | grep on-line`" ]; then
		BATTERY="$BATTERY, charging"
	else
		BATTERY="$BATTERY, discharging"
	fi
	echo -n " | Battery: $BATTERY"
fi
VOLLINE=`amixer get Master | grep "^\\s*Front Left"`

if [ "`echo $VOLLINE | grep "\[on\]"`" ]; then
	VOLUME=`echo $VOLLINE | sed -e "s/\].*//" -e "s/.*\[//"`
else
	VOLUME='muted'
fi

echo -n " | Volume: $VOLUME"

if [ -x /usr/bin/cpufreq-info ]; then
	CPUFREQ="`cpufreq-info -mf`"
	echo -n " | CPU: $CPUFREQ"
fi

if [ -x /usr/bin/mpc ]; then
	if [ "`mpc status | grep "\[playing\]"`" ]; then
		MPDSTAT=`mpc current`
	else
		MPDSTAT='PAUSED'
	fi
	echo " | $MPDSTAT"
fi

