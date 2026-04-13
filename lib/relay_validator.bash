#!/bin/bash
validate_relay() {
    case "$1" in
        1|2|both) return 0 ;;
        *) return 1 ;;
    esac
}

validate_single_relay() {
    case "$1" in
        1|2) return 0 ;;
        *) return 1 ;;
    esac
}