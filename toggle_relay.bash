#!/bin/bash

toggle_relay() {
    local relay=$1
    local ip="192.168.1.199"
    local user="admin"
    local pass="admin"

    echo -e "${CYAN}→ Toggling Relay $relay${RESET}"

    curl -s -u "${user}:${pass}" "http://${ip}/relays.cgi?relay=${relay}" > /dev/null
    sleep 0.6

    read r1 r2 < <(get_all_relay_status)
    state=$( [[ "$relay" == "1" ]] && echo "$r1" || echo "$r2" )

    echo -e "${GREEN}Relay $relay is now ${state^^}${RESET}"
}