#!/usr/bin/env bash

    # Colors
    GREEN="\033[38;5;46m"
    RED="\033[38;5;196m"
    CYAN="\033[38;5;51m"
    PURPLE="\033[38;5;129m"
    YELLOW="\033[38;5;226m"
    RESET="\033[0m"
    DIM="\033[2m"
    BOLD="\033[1m"
    
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