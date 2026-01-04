#!/bin/sh

xset -b
setxkbmap -layout us

touchpads=$(xinput list | grep -i touchpad \
                        | grep -o 'id=[0-9]*' \
                        | cut -d '=' -f 2)

for t in $touchpads
do
	xinput set-prop "$t" "libinput Tapping Enabled" 1 || true
	xinput set-prop "$t" "libinput Natural Scrolling Enabled" 1 || true
done

while true
do
	winterface=$(wpa_cli interface | head -n 1 \
	                               | cut -d ' ' -f 3 \
	                               | tr -d "'")

	if [ -n "$winterface" ]
	then
		ssid=$(wpa_cli -i "$winterface" status | grep '^ssid=' \
		                                       | cut -d '=' -f 2)
	fi

	if [ -z "$ssid" ]
	then
		ssid="None"
	fi

	batdev=$(ls /sys/class/power_supply | grep '^BAT' | head -n 1)
	batperc=$(cat "/sys/class/power_supply/$batdev/capacity")

	case "$(cat /sys/class/power_supply/$batdev/status)" in
		"Charging")
			baticon="⚡"
			;;
		"Discharging")
			baticon="🔋"
			;;
		"Full")
			baticon="✅"
			;;
		"Not charging")
			baticon="⚠️"
			;;
		*)
			baticon="❓"
			;;
	esac

	localdate=$(date +%Y-%m-%d)
	localtime=$(date +%H:%M:%S)
	localzone=$(date +%Z)

	status=$(echo \
	         "📡 $ssid" \
	         " " \
	         "$baticon ${batperc}%" \
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
