#!/bin/bash
show_help() {
    echo -e "${BOLD}Usage:${RESET} ./relayctl.bash <command> [argument]"
    echo ""
    echo "Commands:"
    echo "  status [1|2|both]     Show current relay status"
    echo "  on <1|2|both>         Turn ON  (smart - only if currently OFF)"
    echo "  off <1|2|both>        Turn OFF (smart - only if currently ON)"
    echo "  toggle <1|2>          Force toggle relay"
    echo "  live                  Start live monitoring (refresh every 2s)"
    echo "  help                  Show this help"
    echo ""
    echo "Examples:"
    echo "  ./relayctl.bash status"
    echo "  ./relayctl.bash on 1"
    echo "  ./relayctl.bash off both"
    echo "  ./relayctl.bash live"
}