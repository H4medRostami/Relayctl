#!/bin/bash
source "$(dirname "$0")/banner.bash"
source "$(dirname "$0")/relay_status.bash"
source "$(dirname "$0")/set_relay.bash"
source "$(dirname "$0")/toggle_relay.bash"
source "$(dirname "$0")/show_status.bash"
source "$(dirname "$0")/live_status.bash"
source "$(dirname "$0")/show_help.bash"

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