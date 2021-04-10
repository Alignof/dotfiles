#!/bin/bash

#st_prev=$(cat /sys/class/drm/card0-HDMI-A-1/status)
st_prev="disconnected"

while :
do
    st_next=$(cat /sys/class/drm/card0-DP-2/status)
    if [ $st_prev != $st_next ]; then
        st_prev=$st_next
        if [ $st_next = "connected" ]; then
	    xrandr --output eDP1 --mode 1366x768 --output DP2 --auto --above eDP1
        else
	    xrandr --output eDP1 --mode 1366x768 --output DP2 --off
        fi
	~/.fehbg
    fi
    sleep 1
done
