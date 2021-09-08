i3-msg "workspace 1; append_layout /home/takana/.config/i3/workspace-1.json"
(alacritty -t main_term &)
(alacritty -o font.size=7 -t with_gotop -e gotop &)
(alacritty -o font.size=10 -t sub_term &)
