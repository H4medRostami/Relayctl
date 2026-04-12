#!/bin/bash
show_status() {
    local target=${1:-both}

    read relay1 relay2 < <(get_all_relay_status)

    echo -e "\n${CYAN}${BOLD}Uswitch Relay Status at: ${RESET}   $(date '+%Y-%m-%d %H:%M:%S')\n"

    printf "${BLUE}%-8s %-12s${RESET}\n" "Relay" "State"
    echo "──────────────────────────────"

    if [[ "$target" == "both" || "$target" == "1" ]]; then
        [[ "$relay1" == "on" ]] && printf "%-8s ${GREEN}● ON${RESET}\n" "1" \
                                || printf "%-8s ${RED}● OFF${RESET}\n" "1"
    fi

    if [[ "$target" == "both" || "$target" == "2" ]]; then
        [[ "$relay2" == "on" ]] && printf "%-8s ${GREEN}● ON${RESET}\n" "2" \
                                || printf "%-8s ${RED}● OFF${RESET}\n" "2"
    fi

    echo ""
}