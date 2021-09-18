i3-msg "workspace 1; append_layout /home/takana/.config/i3/workspace-1.json"
(alacritty -t primary &)
(alacritty -o font.size=7 -t gotop -e gotop --nvidia &)
(alacritty -o font.size=10 -t secondary &)
