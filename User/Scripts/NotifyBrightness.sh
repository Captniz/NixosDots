#!/bin/sh

dunstify "Brigthness: $(brightnessctl -m | cut -d, -f4 | tr -d %)%" -t 1200 -r 1