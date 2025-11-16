#!/bin/sh
TERMINAL_ID=$(xdotool search --onlyvisible --class kitty | head -n 1)
xdotool windowactivate "$TERMINAL_ID"

sleep 0.1

case $1 in
    1)
        IP=$(ip -4 -j addr show | jq -r '(.[] | select(.ifname=="tun0") | .addr_info[] | select(.family=="inet") | .local) // (.[] | select(.ifname=="eth0") | .addr_info[] | select(.family=="inet") | .local)')
        xdotool type --clearmodifiers --delay 0 "$IP"
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
