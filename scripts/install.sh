#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Log file
LOG_FILE="$SCRIPT_DIR/simple_hyprland_install.log"

# Trap for unexpected exits
trap 'trap_message' INT TERM

function trap_message {
    print_error "Script interrupted. Exiting.....\n"
    # Add any cleanup code here
    log_message "Script interrupted and exited"
    exit 1
}

# Function to log messages
function log_message {
    echo "$(date): $1" >> "$LOG_FILE"
}

# Function to print ASCII art using figlet if installed, otherwise use print_info
function print_ascii_art {
    local text="$1"
    if command -v figlet &> /dev/null; then
        echo -e "${BLUE}"
        figlet -f small "$text"
        echo -e "${NC}"
    else
        print_info "$text"
    fi
}

# Functions for colored output
function print_error {
    echo -e "${RED}$1${NC}"
}

function print_success {
    echo -e "${GREEN}$1${NC}"
}

function print_warning {
    echo -e "${YELLOW}$1${NC}"
}

function print_info {
    echo -e "${BLUE}$1${NC}"
}

# Function to ask for confirmation
function ask_confirmation {
    while true; do
        read -p "$(print_warning "$1 (y/n): ")" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            return 0  # User confirmed
        elif [[ $REPLY =~ ^[Nn]$ ]]; then
            print_error "Operation cancelled.\n"
            return 1  # User cancelled
        else
            print_error "Invalid input. Please answer y or n.\n"
        fi
    done
}

# Function to run a command with retry and confirmation
function run_command {
    local cmd="$1"
    local description="$2"
    if ask_confirmation "Do you want to run: $description"; then
        while ! eval "$cmd"; do
            print_error "Command failed."
            if ! ask_confirmation "Retry $description?"; then
                print_warning "$description was not completed."
                return 1
            fi
        done
        print_success "$description completed successfully."
        return 0
    else
        print_warning "$description was skipped."
        return 1
    fi
}

# Function to run a script with retry and confirmation
function run_script {
    local script="$SCRIPT_DIR/$1"
    local description="$2"
    if ask_confirmation "Do you want to execute '$description' script"; then
        while ! bash "$script"; do
            print_error "$description script failed."
            if ! ask_confirmation "Retry $description"; then
                return 1  # User chose not to retry
            fi
        done
        print_success "$description completed successfully.\n"
    else
        return 1  # User chose not to run the script
    fi
}
#--------------------------------------------------------------

#    ____ _____  _    ____ _____ 
#   / ___|_   _|/ \  |  _ \_   _|
#   \___ \ | | / _ \ | |_) || |  
#    ___) || |/ ___ \|  _ < | |  
#   |____/ |_/_/   \_\_| \_\|_|  

# Script start
log_message "Installation started"
print_ascii_art "Simple Hyprland"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    print_error "Please run as root"
    log_message "Script not run as root. Exiting."
    exit 1
fi

# Check if OS is Arch Linux
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID" != "arch" ]]; then
        print_warning "This script is designed for Arch Linux. Your system: $PRETTY_NAME"
        if ! ask_confirmation "Continue anyway?"; then
            log_message "Installation cancelled due to unsupported OS"
            exit 1
        fi
    else
        print_success "Arch Linux detected. Proceeding with installation.\n"
        log_message "Arch Linux detected. Installation proceeding."
    fi
else
    print_error "Unable to determine OS. /etc/os-release not found."
    if ! ask_confirmation "Continue anyway?"; then
        log_message "Installation cancelled due to unknown OS"
        exit 1
    fi
fi

# Run child scripts
run_script "prerequisites.sh" "Prerequisites Setup"
run_script "hypr.sh" "Hyprland & Critical Softwares Setup"
run_script "utilities.sh" "Basic Utilities & Configs"
run_script "theming.sh" "Themes and Tools"
run_script "final.sh" "Final"

print_ascii_art "Setup Complete"
log_message "Installation completed successfully"
