#!/bin/sh

xset -b
setxkbmap -layout it -option ctrl:nocaps

while true; do
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
	         "🔋 $battery $battery_status" \
	         " " \
	         "$localdate $localtime $localzone" \
	         "")

	xsetroot -name "$status"
	sleep 1
done &

exec dwm &

mpv --wid=0 --loop=inf ~/.local/share/wallpaper.mp4
