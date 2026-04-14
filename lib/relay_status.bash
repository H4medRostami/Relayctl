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
    
# Returns two values: state_of_relay1 state_of_relay2
get_all_relay_status() {
    local ip="192.168.1.199"
    local user="admin"
    local pass="admin"

    local xml=$(curl -s -u "${user}:${pass}" "http://${ip}/status.xml")

    local r1=$(echo "$xml" | grep -oP '(?<=<relay1>)[^<]+')
    local r2=$(echo "$xml" | grep -oP '(?<=<relay2>)[^<]+')

    # Convert to "on"/"off"
    [[ "$r1" == "1" ]] && r1="on" || r1="off"
    [[ "$r2" == "1" ]] && r2="on" || r2="off"

    echo "$r1 $r2"
}