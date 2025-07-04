#!/bin/sh

xset -b
setxkbmap -layout it -option ctrl:nocaps

while true; do
	wireless_interface=$(ip link show | grep -E '^[0-9]+: ' \
	                                  | grep -i 'wl' | cut -d: -f2 \
	                                  | tr -d ' ' | head -n 1 \
	                                  | sed 's/:.*//;s/ //g' | grep '^w')

	if [ -n "$wireless_interface" ]; then
		ssid=$(wpa_cli -i "$wireless_interface" status \
		                                        | grep '^ssid=' \
		                                        | cut -d '=' -f 2)
	fi

	if [ -z "$ssid" ]; then
		ssid="None"
	fi

	battery_device=$(ls /sys/class/power_supply | grep '^BAT' | head -n 1)
	battery=$(cat "/sys/class/power_supply/$battery_device/capacity")%

	case "$(cat /sys/class/power_supply/$battery_device/status)" in
		"Charging")
			battery_status="[⚡]"
			;;
		"Discharging")
			battery_status="[🔌]"
			;;
		"Full")
			battery_status="[✅]"
			;;
		"Not charging")
			battery_status="[⚠️]"
			;;
		*)
			battery_status="[❓]"
			;;
	esac

	localdate=$(date +%Y-%m-%d)
	localtime=$(date +%H:%M:%S)
	localzone=$(date +%Z)

	status=$(echo \
	         "📡 $ssid" \
	         " " \
	         "🔋 $battery $battery_status" \
	         " " \
	         "📅 $localdate" \
	         " " \
	         "🕒 $localtime $localzone" \
	         "")

	xsetroot -name "$status"
	sleep 1
done &

feh --bg-fill ~/.local/share/wallpaper.png

xcompmgr -cfr 12 -l -15 -t -15 -o 1.0 -I 0.03 -O 0.03 -D 5 &

exec dwm
