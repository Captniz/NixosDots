#!/usr/bin/env bash

SERVICE="hypridle"

if systemctl --user is-active --quiet "$SERVICE"; then
    systemctl --user stop "$SERVICE"
    notify-send -u normal -i display "Hypridle Disabled" "Idle display shutdown paused."
else
    systemctl --user start "$SERVICE"
    notify-send -u low -i display "Hypridle Enabled" "Idle display shutdown active." 
fi