#!/bin/bash

BATTERY_PATH="/org/freedesktop/UPower/devices/battery_BAT1"


# Function to send notifications via dunst
send_notification() {
    local urgency=$1
    local icon=$2
    local title=$3
    local message=$4
    notify-send -u "$urgency" -i "$icon" "$title" "$message"
}

# Listen to DBus PropertiesChanged for the battery
dbus-monitor --system "interface='org.freedesktop.DBus.Properties',member='PropertiesChanged',path='$BATTERY_PATH'" |
while read -r line; do
    # When a property changes, get current values
if echo "$line" | grep -q "Percentage"; then
    BATTERY_PERCENT=$(upower -i "$BATTERY_PATH" | awk '/percentage:/ {gsub("%",""); printf "%d\n", $2}')
    BATTERY_STATE=$(upower -i "$BATTERY_PATH" | awk '/state:/ {gsub("%",""); printf "%s\n", $2}')

    # Only notify if discharging
    if [ "$BATTERY_STATE" == "discharging" ]; then
        if [ "$BATTERY_PERCENT" -eq 25 ]; then
            send_notification "normal" "battery-caution-symbolic" "Battery Low" "$BATTERY_PERCENT% remaining"

        elif [ "$BATTERY_PERCENT" -eq 10 ]; then
            send_notification "critical" "battery-caution-symbolic" "Battery Critical" "Only $BATTERY_PERCENT% remaining!"
        
        elif [ "$BATTERY_PERCENT" -eq 5 ]; then
            send_notification "critical" "battery-empty" "Hibernation Imminent" "Only $BATTERY_PERCENT% remaining! Will soon hibernate!"
        fi
    fi

fi

done
