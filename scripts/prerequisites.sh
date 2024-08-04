#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source the master script
source "$SCRIPT_DIR/install.sh"

log_message "Installation started for prerequisites section"
print_info "Starting prerequisites setup..."


run_command "sudo pacman -Syyu --noconfirm" "Update package database and upgrade packages"
