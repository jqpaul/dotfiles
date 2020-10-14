# setxkbmap de
# xmodmap ~/.config/xmodmap/.Xmodmap_DE
compton --config ~/.config/compton/compton.conf &
redshift -l 52.382:9.736 -t 6000:4000 &
xbindkeys -f /home/joe/.xbindkeysrc
# conky --config=/home/joe/.conky/conky/conky.conf &
xscreensaver -nosplash &
mopidy &
# sh ~/Programming/bin/mount.sh
sh ~/Programming/bin/zatback.sh
xset s off
# python /home/joe/bg/src/bg.py 13 &
# exec i3 --shmlog-size=26214400
xsetroot -cursor_name left_ptr
xmonad --recompile
exec xmonad
# exec dwm
