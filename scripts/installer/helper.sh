#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Log file
LOG_FILE="$SCRIPT_DIR/simple_hyprland_install.log"

function trap_message {
    print_error "\n\nScript interrupted. Exiting.....\n"
    # Add any cleanup code here
    log_message "Script interrupted and exited"
    exit 1
}

# Function to log messages
function log_message {
    echo "$(date): $1" >> "$LOG_FILE"
}

# Functions for colored/bold output
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

function print_bold_blue {
    echo -e "${BLUE}${BOLD}$1${NC}"
}

# Function to ask for confirmation
function ask_confirmation {
    while true; do
        read -p "$(print_warning "$1 (y/n): ")" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            log_message "Operation accepted by user."
            return 0  # User confirmed
            elif [[ $REPLY =~ ^[Nn]$ ]]; then
            log_message "Operation cancelled by user."
            print_error "Operation cancelled."
            return 1  # User cancelled
        else
            print_error "Invalid input. Please answer y or n."
        fi
    done
}

# Function to run a command with optional confirmation and retry
function run_command {
    local cmd="$1"
    local description="$2"
    local ask_confirm="${3:-yes}"  # Default to asking for confirmation
    local use_sudo="${4:-yes}"     # Default to using sudo
    
    log_message "Attempting to run: $description"
    
    if [[ "$ask_confirm" == "yes" ]]; then
        if ! ask_confirmation "\n$description"; then
            # print_info "$description was skipped."
            log_message "$description was skipped by user choice."
            return 1
        fi
    else
        print_info "\n$description"  # Echo what it's doing without confirmation
    fi
    
    local full_cmd=""
    if [[ "$use_sudo" == "no" ]]; then
        full_cmd="sudo -u $SUDO_USER $cmd"
    else
        full_cmd="$cmd"
    fi
    
    while ! eval "$full_cmd"; do
        print_error "Command failed."
        log_message "Command failed: $cmd"
        if [[ "$ask_confirm" == "yes" ]]; then
            if ! ask_confirmation "Retry $description?"; then
                print_warning "$description was not completed."
                log_message "$description was not completed due to failure and user chose not to retry."
                return 1
            fi
        else
            print_warning "$description failed and will not be retried."
            log_message "$description failed and was not retried (auto mode)."
            return 1
        fi
    done
    
    print_success "$description completed successfully."
    log_message "$description completed successfully."
    return 0
}

# Function to run a script with retry and confirmation
function run_script {
    local script="$SCRIPT_DIR/$1"
    local description="$2"
    if ask_confirmation "\nExecute '$description' script"; then
        while ! bash "$script"; do
            print_error "$description script failed."
            if ! ask_confirmation "Retry $description"; then
                return 1  # User chose not to retry
            fi
        done
        print_success "\n$description completed successfully."
    else
        return 1  # User chose not to run the script
    fi
}

function check_root {
    if [ "$EUID" -ne 0 ]; then
        print_error "Please run as root"
        log_message "Script not run as root. Exiting."
        exit 1
    fi
    
    # Store the original user for later use
    SUDO_USER=$(logname)
    log_message "Original user is $SUDO_USER"
}

function check_os {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [[ "$ID" != "arch" ]]; then
            print_warning "This script is designed for Arch Linux. Your system: $PRETTY_NAME"
            if ! ask_confirmation "Continue anyway?"; then
                log_message "Installation cancelled due to unsupported OS"
                exit 1
            fi
        else
            print_success "Arch Linux detected. Proceeding with installation."
            log_message "Arch Linux detected. Installation proceeding."
        fi
    else
        print_error "Unable to determine OS. /etc/os-release not found."
        if ! ask_confirmation "Continue anyway?"; then
            log_message "Installation cancelled due to unknown OS"
            exit 1
        fi
    fi
}