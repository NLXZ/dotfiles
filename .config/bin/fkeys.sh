#!/bin/bash

TERMINAL_ID=$(xdotool search --onlyvisible --class kitty | head -n 1)
xdotool windowactivate "$TERMINAL_ID"
sleep .1

case $1 in
    1)
        if ip link show tun0 &>/dev/null; then
            xdotool type --clearmodifiers --delay 0 "$(ip addr show tun0 | grep 'inet ' | awk '{ print $2 }' | cut -d/ -f1)"
        else
            xdotool type --clearmodifiers --delay 0 "$(hostname -I | awk '{ print $1 }')"
        fi
    ;;
    2)
        xdotool type --clearmodifiers --delay 0 "$(awk 'NR==1{printf $0; next} {print}' ~/.target 2>/dev/null)"
    ;;
    3)
        xsel -xc
    ;;
    4)
        xsel -bo | xsel -pi && xsel -x && xsel -po | xsel -bi && xdotool key ctrl+shift+v && xsel -x && xsel -po | xsel -bi
    ;;
    *)
        true
    ;;
esac
