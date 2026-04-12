#!/bin/bash

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