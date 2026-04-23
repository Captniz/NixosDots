#!/bin/sh

dunstify "Volume: $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f%%", $2 * 100; if ($3) printf " %s", $3}')" -t 1200 -r 1