#!/bin/bash

#st_prev=$(cat /sys/class/drm/card0-HDMI-A-1/status)
st_prev="disconnected"

while :
do
    st_next=$(cat /sys/class/drm/card0-DP-2/status)
    if [ $st_prev != $st_next ]; then
        st_prev=$st_next
        if [ $st_next = "connected" ]; then
	    xrandr --output HDMI-0 --mode 1440x900 --output DP2 --mode 1920x1080 --above eDP1
        else
	    xrandr --output HDMI-0 --mode 1440x900 --output DP2 --off
        fi
	~/.fehbg
    fi
    sleep 1
done
