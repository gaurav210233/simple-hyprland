#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "pacman -S --noconfirm waybar" "Install Waybar" "yes"
run_command "cp -r ~/simple-hyprland/configs/waybar ~/.config/" "Copy Waybar config" "yes"

run_command "yay -S tofi" "Install tofi" "yes" "no"
run_command "cp -r ~/simple-hyprland/configs/tofi ~/.config/" "Copy tofi config(s)" "yes"

run_command "pacman -S cliphist" "Install cliphist" "yes"

run_command "yay -S swww" "yes" "no"
run_command "cp -r ~/simple-hyprland/assets/backgrounds ~/.config/assets/backgrounds/" "Copy sample wallpapers (Recommended)" "yes"

run_command "yay -S hyprpicker" "yes" "no"

run_command "yay -S hyprlock" "yes" "no"
run_command "cp ~/simple-hyprland/configs/hypr/hyprlock.conf ~/.config/hypr/" "Copy hyprlock config" "yes"

run_command "yay -S hypridle" "yes" "no"
run_command "cp ~/simple-hyprland/configs/hypr/hypridle.conf ~/.config/hypr/" "Copy hypridle config" "yes"

run_command "yay -S wlogout" "yes" "no"
run_command "cp -r ~/simple-hyprland/configs/wlogout ~/.config/ && cp -r ~/simple-hyprland/assets/wlogout ~/.config/assets/ # copying assets" "Copy hypridle config" "yes"

run_command "yay -S grimblast" "yes" "no"