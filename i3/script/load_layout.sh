i3-msg "workspace 6; append_layout /home/takana/.config/i3/workspace-6.json"
(alacritty -t primary &)
(alacritty -o font.size=7 -t bottom -e btm --enable_gpu --hide_table_gap &)
(alacritty -o font.size=10 -t secondary &)
