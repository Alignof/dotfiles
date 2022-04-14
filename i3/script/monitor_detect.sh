#!/bin/bash

#st_prev=$(cat /sys/class/drm/card0-HDMI-A-1/status)
xrandr --output HDMI-0 --mode 3840x2160 --primary --output DVI-I-1 --mode 1920x1080 --left-of HDMI-0


# 
# st_prev="disconnected"
# 
# while :
# do
#     #st_next=$(cat /sys/class/drm/card0-DP-2/status)
#     st_next="disconnected"
#     if [ $st_prev != $st_next ]; then
#         st_prev=$st_next
#         if [ $st_next = "connected" ]; then
# 	    xrandr --output HDMI-0 --mode 3840x2160 --primary --output DVI-I-1 --mode 1920x1080 --right-of HDMI-0
#         else
# 	    xrandr --output HDMI-0 --mode 3840x2160 --primary --output DVI-I-1 --off
#         fi
# 	~/.fehbg
#     fi
#     sleep 1
# done
# 
