#!/bin/bash
    # Colors
    GREEN="\033[38;5;46m"
    RED="\033[38;5;196m"
    CYAN="\033[38;5;51m"
    PURPLE="\033[38;5;129m"
    YELLOW="\033[38;5;226m"
    RESET="\033[0m"
    DIM="\033[2m"
    BOLD="\033[1m"
    
set_relay() {
    local relay=$1          # 1, 2, or "both"
    local desired=$2        # "on" or "off"
    local ip="192.168.1.199"
    local user="admin"
    local pass="admin"

    if [[ "$relay" == "both" ]]; then
        set_relay 1 "$desired"
        set_relay 2 "$desired"
        return
    fi

    # Get current state
    read current_r1 current_r2 < <(get_all_relay_status)
    current=$( [[ "$relay" == "1" ]] && echo "$current_r1" || echo "$current_r2" )

    if [[ "$current" == "$desired" ]]; then
        echo -e "${YELLOW}Relay $relay is already ${desired^^}${RESET}"
        return
    fi

    # Toggle to change state
    echo -e "${CYAN}→ Toggling Relay $relay to make it ${desired^^}...${RESET}"

    curl -s -u "${user}:${pass}" "http://${ip}/relays.cgi?relay=${relay}" > /dev/null
    sleep 0.6

    # Verify new state
    read new_r1 new_r2 < <(get_all_relay_status)
    new_state=$( [[ "$relay" == "1" ]] && echo "$new_r1" || echo "$new_r2" )

    if [[ "$new_state" == "$desired" ]]; then
        echo -e "${GREEN}✓ Success: Relay $relay is now ${desired^^}${RESET}"
    else
        echo -e "${RED}✗ Failed to change Relay $relay${RESET}"
    fi
}