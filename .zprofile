[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export PATH="$HOME/.local/bin:$PATH"
