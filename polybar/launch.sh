#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar for each monitor

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | grep -v "DP-1-2-1" | cut -d" " -f1); do
        MONITOR=$m polybar -q main -c "$DIR/config.ini" &
    done
else
    polybar -q main -c "$DIR/config.ini" &
fi

