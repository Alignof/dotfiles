swaymsg "workspace 7; append_layout /home/takana/.config/i3/workspace-7.json"
(alacritty -t primary &)
(alacritty -o font.size=7 -t bottom -e btm --enable_gpu_memory --hide_table_gap &)
(alacritty -o font.size=10 -t secondary &)
