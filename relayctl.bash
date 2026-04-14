#!/usr/bin/env bash

source "$(dirname "$0")/lib/banner.bash"
source "$(dirname "$0")/lib/relay_status.bash"
source "$(dirname "$0")/lib/set_relay.bash"
source "$(dirname "$0")/lib/toggle_relay.bash"
source "$(dirname "$0")/lib/show_status.bash"
source "$(dirname "$0")/lib/live_status.bash"
source "$(dirname "$0")/lib/show_help.bash"
source "$(dirname "$0")/lib/relay_validator.bash"

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

    minimal|popup|live-minimal|live|watch|monitor)
        live_status
        ;;

    status)
        if [[ -z "$2" ]]; then
            show_status "both"
        elif validate_relay "$2"; then
            show_status "$2"
        else
            echo -e "${RED}Error: Invalid relay. Use 1 | 2 | both${RESET}"
            exit 1
        fi
        ;;

    on|off)
        if [[ -z "$2" ]]; then
            echo -e "${RED}Error: Please specify relay (1, 2 or both)${RESET}"
            exit 1
        fi

        if validate_relay "$2"; then
            set_relay "$2" "$1"
        else
            echo -e "${RED}Error: Invalid relay. Use 1 | 2 | both${RESET}"
            exit 1
        fi
        ;;

    toggle)
        if [[ -z "$2" ]]; then
            echo -e "${RED}Error: Please specify relay (1 or 2)${RESET}"
            exit 1
        fi

        if validate_single_relay "$2"; then
            toggle_relay "$2"
        else
            echo -e "${RED}Error: Invalid relay. Use 1 or 2 only${RESET}"
            exit 1
        fi
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
        exit 1
        ;;
esac