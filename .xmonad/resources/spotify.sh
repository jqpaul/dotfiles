#!/bin/bash
running=$(pidof spotify)
pla="-"
if [ "$running" != "" ]; then
	if [ "$(playerctl status)" == "Paused" ]; then 
		pla="||"
	else
		pla=">"
	fi
    artist=$(playerctl metadata artist)
    song=$(playerctl metadata title | cut -c 1-60)
    echo -n "$artist $pla $song"
fi
