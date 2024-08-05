#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

# Trap for unexpected exits
trap 'trap_message' INT TERM

# Script start
log_message "Installation started"
print_bold_blue "\nSimple Hyprland\n"

# Check if running as root
check_root

# Check if OS is Arch Linux
check_os

# Run child scripts
run_script "prerequisites.sh" "Prerequisites Setup"
# run_script "hypr.sh" "Hyprland & Critical Softwares Setup"
# run_script "utilities.sh" "Basic Utilities & Configs"
# run_script "theming.sh" "Themes and Tools"
# run_script "final.sh" "Final"

print_bold_blue "🌟 Setup Complete\n"
log_message "Installation completed successfully"
