CONSOLE_KIT='dbus-send --system --print-reply \
	--dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager \
	org.freedesktop.ConsoleKit.Manager'
UPOWER='dbus-send --system --print-reply \
	--dest="org.freedesktop.UPower" /org/freedesktop/UPower \
	org.freedesktop.UPower'

case $1 in 
	stop) $CONSOLE_KIT.Stop ;;
	restart) $CONSOLE_KIT.Restart ;;
	suspend) $UPOWER.Suspend ;;
esac

