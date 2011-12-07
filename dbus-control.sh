#!/bin/sh

function dbus_send_ck {
	dbus-send --system --print-reply \
		--dest="org.freedesktop.ConsoleKit" \
		/org/freedesktop/ConsoleKit/Manager \
		org.freedesktop.ConsoleKit.Manager.$1
}

function dbus_send_upower {
	dbus-send --system --print-reply \
		--dest="org.freedesktop.UPower" /org/freedesktop/UPower \
		org.freedesktop.UPower.$1
}

case $1 in 
	stop) dbus_send_ck Stop ;;
	restart) dbus_send_ck Restart ;;
	suspend) dbus_send_upower Restart ;;
	*) echo "Usage: $0 stop|restart|suspend" ;;
esac

