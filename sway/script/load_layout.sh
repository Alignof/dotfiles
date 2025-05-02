#!/bin/zsh
swaymsg "workspace 7;
exec alacritty --class primary &;"
sleep 0.3s;
swaymsg "[app_id=primary] splith;"
swaymsg "exec alacritty -o font.size=5 --class bottom -e btm --enable_gpu --hide_table_gap &;"
sleep 0.3s;
swaymsg "[app_id=primary] resize set width 855px;"
swaymsg "[app_id=bottom] focus; splitv;"
swaymsg "exec alacritty -o font.size=8 --class secondary &;"
