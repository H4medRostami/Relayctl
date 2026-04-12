#!/bin/bash

# ====================== Clean Minimal Live Window ======================
live_status() {
    trap "tput cnorm; clear; exit" INT
    tput civis

    # Colors
    GREEN="\033[38;5;46m"
    RED="\033[38;5;196m"
    CYAN="\033[38;5;51m"
    YELLOW="\033[38;5;226m"
    RESET="\033[0m"

    clear

    # Banner (printed once)
    show_banner
    echo ""

    # Save cursor position after banner
    echo -ne "\033[s"

    spinner=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    i=0

    while true; do
        # restore position under banner
        echo -ne "\033[u"

        # =====================
        # TIME LINE (clean overwrite)
        # =====================
        printf "\r\033[K${CYAN}Time: %s${RESET}\n" "$(date '+%Y-%m-%d %H:%M:%S')"

        # get relay state
        read r1 r2 < <(get_all_relay_status)

        # =====================
        # RELAY 1
        # =====================
        if [[ "$r1" == "on" ]]; then
            printf "\r\033[KRelay 1: ${GREEN}● ON ${RESET}\n"
        else
            printf "\r\033[KRelay 1: ${RED}● OFF${RESET}\n"
        fi

        # =====================
        # RELAY 2
        # =====================
        if [[ "$r2" == "on" ]]; then
            printf "\r\033[KRelay 2: ${GREEN}● ON ${RESET}\n"
        else
            printf "\r\033[KRelay 2: ${RED}● OFF${RESET}\n"
        fi

        # =====================
        # ANIMATION LINE
        # =====================
        printf "\r\033[K${YELLOW}%s Updating...${RESET}\n" "${spinner[i]}"

        ((i=(i+1)%${#spinner[@]}))

        sleep 0.2
    done
}