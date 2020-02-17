export DISPLAY=:0
setxkbmap de
xmodmap ~/.config/xmodmap/.Xmodmap_DE
compton --config ~/.config/compton/compton.conf &
redshift -l 52.382:9.736 -t 4500:3000 &
xbindkeys -f /home/joe/.xbindkeysrc
conky --config=/home/joe/.conky/conky/conky.conf &
xscreensaver &
sh ~/Programming/bin/mount.sh
xset s off
python /home/joe/bg/src/bg.py &
exec i3 --shmlog-size=26214400
