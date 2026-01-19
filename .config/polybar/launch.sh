#!/bin/sh

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar -q main & bash ~/.config/polybar/dock.sh auto
