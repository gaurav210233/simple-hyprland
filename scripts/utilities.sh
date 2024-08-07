#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "pacman -S --noconfirm waybar" "Install Waybar - Status Bar" "yes"
run_command "cp -r ~/simple-hyprland/configs/waybar ~/.config/" "Copy Waybar config" "yes"

run_command "yay -S --sudoloop --noconfirm tofi" "Install Tofi - Application Launcher" "yes" "no"
run_command "cp -r ~/simple-hyprland/configs/tofi ~/.config/" "Copy Tofi config(s)" "yes"

run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" "yes"

run_command "yay -S --sudoloop --noconfirm swww" "Install SWWW for wallpaper management" "yes" "no"
run_command "cp -r ~/simple-hyprland/assets/backgrounds ~/.config/assets/backgrounds/" "Copy sample wallpapers to assets directory (Recommended)" "yes"

run_command "yay -S --sudoloop --noconfirm hyprpicker" "Install Hyprpicker - Color Picker" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hyprlock" "Install Hyprlock - Screen Locker (Must)" "yes" "no"
run_command "cp ~/simple-hyprland/configs/hypr/hyprlock.conf ~/.config/hypr/" "Copy Hyprlock config" "yes"

run_command "yay -S --sudoloop --noconfirm wlogout" "Install Wlogout - Session Manager" "yes" "no"
run_command "cp -r ~/simple-hyprland/configs/wlogout ~/.config/ && cp -r ~/simple-hyprland/assets/wlogout ~/.config/assets/" "Copy Wlogout config and assets" "yes"

run_command "yay -S --sudoloop --noconfirm grimblast" "Install Grimblast - Screenshot tool" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hypridle" "Install Hypridle for idle management (Must)" "yes" "no"
run_command "cp ~/simple-hyprland/configs/hypr/hypridle.conf ~/.config/hypr/" "Copy Hypridle config" "yes" 

echo "------------------------------------------------------------------------"