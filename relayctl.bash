#!/bin/bash
source "$(dirname "$0")/banner.bash"
source "$(dirname "$0")/relay_status.bash"
source "$(dirname "$0")/set_relay.bash"
source "$(dirname "$0")/toggle_relay.bash"
source "$(dirname "$0")/show_status.bash"
source "$(dirname "$0")/live_status.bash"
source "$(dirname "$0")/show_help.bash"

    # Colors
    GREEN="\033[38;5;46m"
    RED="\033[38;5;196m"
    CYAN="\033[38;5;51m"
    PURPLE="\033[38;5;129m"
    YELLOW="\033[38;5;226m"
    RESET="\033[0m"
    DIM="\033[2m"
    BOLD="\033[1m"
    
# Main logic
case "$1" in
    minimal|popup|live-minimal)
        live_status
        ;;
    status)
        show_status "${2:-both}"
        ;;
    on|off)
        if [[ -z "$2" ]]; then
            echo -e "${RED}Error: Please specify relay (1, 2 or both)${RESET}"
            exit 1
        fi
        set_relay "$2" "$1"
        ;;
    toggle)
        if [[ -z "$2" ]]; then
            echo -e "${RED}Error: Please specify relay (1 or 2)${RESET}"
            exit 1
        fi
        toggle_relay "$2"
        ;;
    live|watch|monitor)
        live_status
        ;;
    help|--help|-h)
        show_help
        ;;
    about)
        show_banner
        ;;
    *)
        echo -e "${RED}Unknown command: $1${RESET}"
        show_help
        ;;
   
esac