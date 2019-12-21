setxkbmap de
redshift -l 52.382:9.736 -t 4500:3000 &
xbindkeys -f /home/joe/.xbindkeysrc &
compton --config ~/.config/compton/compton.conf &
xset s off
export DISPLAY=:0
python /home/joe/bg/src/bg.py &
conky --config=/home/joe/.conky/conky/conky.conf &
# sudo openvpn --config /etc/openvpn/client/openvpn.ovpn &
exec i3
