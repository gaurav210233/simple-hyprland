#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for prerequisites section"
print_info "\nStarting prerequisites setup..."

run_command "pacman -Syu --noconfirm" "Updating package database and upgrading packages" "no"

# run_command "pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd.. # builds with makepkg" "Installing YAY" "no"

run_command "pacman -S --noconfirm pipewire wireplumber" "Configuring audio" "no"

run_command "pacman -S --noconfirm ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono" "Installing Nerd Fonts and Symbols" "no"

run_command "pacman -S --noconfirm sddm && systemctl enable sddm.service" "Install and enable SDDM (Recommended)" "yes"

run_command "yay -S --sudoloop --noconfirm brave-bin" "Install Brave Browser" "yes" "no" 

run_command "pacman -S --noconfirm kitty" "Install Kitty (Recommended)" "yes"

run_command "pacman -S --noconfirm nano" "Install nano" "yes"

run_command "pacman -S --noconfirm tar" "Installing tar for extracting files" "no"

