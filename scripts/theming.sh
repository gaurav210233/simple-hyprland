#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for theming section"
print_info "\nStarting theming setup..."

run_command "pacman -S --noconfirm nwg-look" "GTK settings" "yes" 

run_command "pacman -S --noconfirm qt5ct qt6ct kvantum" "QT Settings" "yes"

run_command "tar -xvf ~/simple-hyprland/assets/themes/Catppuccin-Mocha.tar.xz -C /usr/share/themes/" "Catppuccin GTK Theme" "yes"

run_command "tar -xvf ~/simple-hyprland/assets/icons/Tela-circle-dracula.tar.xz -C /usr/share/icons/" "Tela icon theme" "yes"

run_command "yay -S --sudoloop --noconfirm kvantum-theme-catppuccin-git" "Catppuccin kvantum Theme" "yes"

run_command "cp -r ~/simple-hyprland/configs/kitty ~/.config/" "Catppuccin kitty theme" "yes"

# Add instructions to configure theming here
