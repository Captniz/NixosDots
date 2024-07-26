if bluetoothctl show | grep -q "Powered: yes"; then
    echo "yes"
else
    echo "no"
fi