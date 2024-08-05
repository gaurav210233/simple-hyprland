#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for hypr section"
print_info "\nStarting hypr setup..."

run_command "pacman -S --noconfirm hyprland" "Install Hyprland" "no"
run_command "cp ~/simple-hyprland/configs/hypr/hyprland.conf ~/.config/hypr/" "Copy hyprland config (Must)" "yes"

run_command "pacman -S --noconfirm xdg-desktop-portal-hyprland" "Install Desktop portal" "no"

run_command "pacman -S --noconfirm polkit-kde-agent" "Install KDE Polkit" "no"

run_command "pacman -S --noconfirm dunst" "Install notification-daemon (Recommended)" "yes"
run_command "cp -r ~/simple-hyprland/configs/dunst ~/.config/" "Copy dunst config" "yes"

run_command "pacman -S --noconfirm qt5-wayland qt6-wayland" "Install QT support on wayland" "no"