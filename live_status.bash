#!/bin/bash

# ====================== Clean Minimal Live Window ======================
live_status() {
    trap "tput cnorm; clear; exit" INT
    tput civis

    # Colors
    GREEN="\033[38;5;46m"
    RED="\033[38;5;196m"
    CYAN="\033[38;5;51m"
    PURPLE="\033[38;5;129m"
    YELLOW="\033[38;5;226m"
    RESET="\033[0m"
    DIM="\033[2m"
    BOLD="\033[1m"

    clear

    # ======================
    # PRINT BANNER ONCE
    # (from external file)
    # ======================
    show_banner
    echo ""

    # Save cursor position after banner
    echo -ne "\033[s"

    # Spinner animation
    spinner=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    i=0

    while true; do
        # Restore position (below banner)
        echo -ne "\033[u"

        # ======================
        # LIVE CONTENT
        # ======================

        # Time
        printf "${CYAN}Time: %s${RESET}\n" "$(date '+%Y-%m-%d %H:%M:%S')"

        # Get relay status
        read r1 r2 < <(get_all_relay_status)

        # Relay 1
        if [[ "$r1" == "on" ]]; then
            printf "Relay 1: ${GREEN}● ON${RESET}\n"
        else
            printf "Relay 1: ${RED}● OFF${RESET}\n"
        fi

        # Relay 2
        if [[ "$r2" == "on" ]]; then
            printf "Relay 2: ${GREEN}● ON${RESET}\n"
        else
            printf "Relay 2: ${RED}● OFF${RESET}\n"
        fi

        # ======================
        # ANIMATION LINE
        # ======================
        printf "${GREEN}%s Updating...${RESET}\n" "${spinner[i]}"

        ((i=(i+1)%${#spinner[@]}))

        sleep 0.2
    done
}