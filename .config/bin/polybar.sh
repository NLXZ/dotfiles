#!/bin/sh
bars="main time date"

pkill -x polybar
while pgrep -x polybar >/dev/null; do sleep 0.1; done

for bar in $bars; do
    polybar -q "$bar" &
    sleep 0.1
done
