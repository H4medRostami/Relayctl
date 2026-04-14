#!/usr/bin/env bash
show_banner() {
    clear
    echo -e "${BOLD}"
    cat << "EOF"
╔════════════════════════════════════════════════════════════════════════════╗
║                                                                            ║
║   ▄█▀▄  ▄█▀▄  ▄█▀▄       RELAYCTL                                          ║
║  ▀█▄█ ▀█▄█ ▀█▄█    Smart Relay Controller                                  ║
║                                                                            ║
╠════════════════════════════════════════════════════════════════════════════╣
║                                                                            ║
║   Author      : Hamed Rostami                                              ║
║   Version     : 1.0.0                                                      ║
║   Updated     : April 2026                                                 ║
║   Device      : Uswitch (2-Relay)                                          ║
║   Features    : Smart ON/OFF • Status Check • Live Monitor                 ║
║                                                                            ║
╚════════════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${RESET}"
}
