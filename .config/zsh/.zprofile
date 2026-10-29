# start niri when login
if [ -z "$WAYLAND_DISPLAY" ] && [ $XDG_VTNR -eq 1 ]; then
    niri-session -l
fi
