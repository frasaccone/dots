#!/bin/sh

xset -b
setxkbmap -layout us

touchpad_id=$(xinput list \
              | grep -i touchpad \
              | grep -o 'id=[0-9]*' \
              | cut -d = -f 2)

if [ -n $touchpad_id ]; then
	xinput set-prop $touchpad_id "libinput Tapping Enabled" 1
	xinput set-prop $touchpad_id "libinput Natural Scrolling Enabled" 1
fi

while true; do
	wireless_interface=$(wpa_cli interface | head -n 1 \
	                                       | cut -d ' ' -f 3 \
	                                       | tr -d "'")

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
			battery_status="⚡"
			;;
		"Discharging")
			battery_status="🔋"
			;;
		"Full")
			battery_status="✅"
			;;
		"Not charging")
			battery_status="⚠️"
			;;
		*)
			battery_status="❓"
			;;
	esac

	localdate=$(date +%Y-%m-%d)
	localtime=$(date +%H:%M:%S)
	localzone=$(date +%Z)

	status=$(echo \
	         "📡 $ssid" \
	         " " \
	         "$battery_status $battery" \
	         " " \
	         "📅 $localdate" \
	         " " \
	         "🕒 $localtime $localzone" \
	         "")

	xsetroot -name "$status"
	sleep 1
done &

feh --bg-fill ~/.wallpaper.png

xcompmgr -cfr 12 -l -15 -t -15 -o 1.0 -I 0.03 -O 0.03 -D 5 &

exec dwm
