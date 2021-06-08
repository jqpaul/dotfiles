redshift -l 52.382:9.736 -t 6000:4000 &
# greenclip daemon &
xrdb -merge ~/.Xresources
xset s off
xset s noblank
xset -dpms
# sh ~/.xsessionrc
sh /home/joe/Programming/bin/bg.sh 34 10
unclutter &
fcitx -d -r
xsetroot -cursor_name left_ptr
mount -a
# exec i3
exec xmonad
