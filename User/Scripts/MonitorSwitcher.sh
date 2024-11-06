#!/bin/sh

# Intervallo di polling in secondi
POLL_INTERVAL=5

# Memorizza lo stato precedente del numero di monitor
previous_monitor_count=0

# Funzione per spostare tutte le workspace esistenti e future sul nuovo monitor
move_all_workspaces_to_new_monitor() {
    sleep 5
    # Ottieni l'elenco di tutti i monitor attualmente connessi
    monitors=($(hyprctl monitors | grep "ID" | awk '{print $2}'))

    # Identifica il nuovo monitor (secondo monitor)
    new_monitor=${monitors[1]}

    # Sposta ogni workspace attualmente attiva sul nuovo monitor
    workspaces=($(hyprctl workspaces -j | jq '.. | .id? // empty'))
    for workspace in "${workspaces[@]}"; do
        hyprctl dispatch moveworkspacetomonitor "$workspace" "$new_monitor"
        echo "Workspace $workspace spostato sul monitor $new_monitor"
    done

    eww close bar
    sleep 10
    eww open bar --screen $(hyprctl activewindow -j | jq '.monitor')
}

# Ciclo principale per il polling dei monitor
while true; do
    # Ottieni il numero corrente di monitor connessi
    current_monitor_count=$(hyprctl monitors | grep -c "ID")

    # Se il numero di monitor è cambiato rispetto al precedente
    if [[ $current_monitor_count -ne $previous_monitor_count ]]; then
        echo "Rilevato cambiamento nel numero di monitor: $current_monitor_count monitor rilevati."
        previous_monitor_count=$current_monitor_count

        # Se il nuovo numero di monitor è almeno 2, esegui la funzione
        if [[ $current_monitor_count -ge 2 ]]; then
            move_all_workspaces_to_new_monitor
            else
            eww close bar
            sleep 10
            eww open bar --screen $(hyprctl activewindow -j | jq '.monitor')
        fi
    fi

    # Attendi l'intervallo di polling prima di controllare di nuovo
    sleep $POLL_INTERVAL
done
