#!/bin/bash

# ====================== Clean Minimal Live Window ======================
live_status() {
    clear
    show_banner
    echo -e "${RED}Press Ctrl + C to close${RESET}\n"

    # Save cursor position after banner
    echo -ne "\033[s"

    while true; do
        # Restore cursor position and update only below banner
        echo -ne "\033[u"

        # Update only status part
        echo -e "${CYAN}Live Status ── $(date '+%Y-%m-%d %H:%M:%S')${RESET}\n"

        printf "${BLUE}%-10s %-15s${RESET}\n" "Relay" "State"
        echo "──────────────────────────────────"

        read relay1 relay2 < <(get_all_relay_status)

        [[ "$relay1" == "on" ]] && printf "%-10s ${GREEN}● ON${RESET}\n" "Relay 1" \
                                || printf "%-10s ${RED}● OFF${RESET}\n" "Relay 1"

        [[ "$relay2" == "on" ]] && printf "%-10s ${GREEN}● ON${RESET}\n" "Relay 2" \
                                || printf "%-10s ${RED}● OFF${RESET}\n" "Relay 2"

        echo -e "\n${YELLOW}Updating every 1 second...${RESET}"

        sleep 1
    done
}