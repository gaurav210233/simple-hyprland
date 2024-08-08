#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for theming section"
print_info "\nStarting theming setup..."

run_command "pacman -S --noconfirm nwg-look" "Install nwg-look for GTK theme management" "yes" 

run_command "pacman -S --noconfirm qt5ct qt6ct kvantum" "Install Qt5, Qt6 Settings, and Kvantum theme engines" "yes"

run_command "tar -xvf /home/$SUDO_USER/simple-hyprland/assets/themes/Catppuccin-Mocha.tar.xz -C /usr/share/themes/" "Install Catppuccin Mocha GTK theme" "yes" 

run_command "tar -xvf /home/$SUDO_USER/simple-hyprland/assets/icons/Tela-circle-dracula.tar.xz -C /usr/share/icons/" "Install Tela Circle Dracula icon theme" "yes"

run_command "yay -S --sudoloop --noconfirm kvantum-theme-catppuccin-git" "Install Catppuccin theme for Kvantum" "yes" "no"

run_command "cp -r /home/$SUDO_USER/simple-hyprland/configs/kitty /home/$SUDO_USER/.config/" "Copy Catppuccin theme configuration for Kitty terminal" "yes" "no"

# Add instructions to configure theming
print_info "\nPost-installation instructions:"
print_bold_blue "Set themes and icons:"
echo "   - Run 'nwg-look' and  set the global GTK and icon theme"
echo "   - Open 'kvantummanager' (run with sudo for system-wide changes) to select and apply the Catppuccin theme"
echo "   - Open 'qt6ct' to set the icon theme"

echo "------------------------------------------------------------------------"