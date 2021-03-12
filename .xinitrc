redshift -l 52.382:9.736 -t 6000:4000 &
greenclip daemon &
xrdb -merge ~/.Xresources
xset s off
xset s noblank
xset -dpms
sh ~/.xsessionrc
unclutter &
fcitx -d -r
xsetroot -cursor_name left_ptr
exec xmonad
