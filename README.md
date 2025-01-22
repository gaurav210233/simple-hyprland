# Simple Hyprland 🌟 
Welcome to the Simple Hyprland Guide! This repository is designed to help users set up a minimal Hyprland environment on Arch Linux. Although various scripts and configuration files are available elsewhere, they often result in bloated systems with many unused themes and configurations. This guide aims to provide a clear, concise, and minimal setup, allowing users to understand each step and customize their environment to their liking.

By the end of this guide, you'll have a clean and functional Hyprland setup like this:

<img src="/assets/github_repo/images/final-setup-01.png" alt="final-setup-01">
<img src="/assets/github_repo/images/final-setup-02.png" alt="final-setup-02">

##### Setup Walkthrough 👇 (Click to Play)
[![Showcase Video](https://raw.githubusercontent.com/gaurav210233/simple-hyprland/main/assets/github_repo/images/Simple_hypr_thumbnail.png)](https://www.youtube.com/watch?v=eNJorbKz_-U)

## Purpose ✨
This guide is intended for:

**Newcomers transitioning to Hyprland who want to gain knowledge.** 👋 If you're new to Hyprland and looking to understand the ins and outs of setting it up, this guide will take you through the process step-by-step, explaining each component along the way.

**Users who wish to set up a minimal system their way, knowing what's happening at each step.**  🧠 Rather than relying on scripts that automate the process, this guide empowers you to build your Hyprland environment from the ground up, enabling you to customize and tweak every aspect according to your preferences.

**Individuals looking to save time by following a structured and efficient setup process.** ⏱️ While many guides and resources are available, they can be scattered and overwhelming. This guide consolidates the essential steps into a streamlined workflow, helping you get up and running with Hyprland quickly and efficiently.

## Getting Started 🚀
If you're new to this guide, you can start from the [Prerequisites section](docs/prerequisites.md). This document outlines the necessary tools, packages, and assumptions required for a smooth installation and setup process.

## Documentation 📚
1. [Prerequisites](docs/prerequisites.md)
2. [Core Installation](docs/installation_Hypr.md)
3. [Basic Configuration](docs/basic_configuration.md)
4. [Useful Utilities](docs/useful_utilities.md)
5. [Theming](docs/theming.md)
6. [Summary](docs/final.md)

## Compatibility ⚙️
While this guide is created with [Arch Linux](https://archlinux.org/) in mind, it can also be helpful for users of other distributions who are familiar with their package management and system tweaking.

## Quick Installation Script 🚀

1. Clone the repository to your home folder:
    ```
    git clone https://github.com/gaurav210233/simple-hyprland.git ~/simple-hyprland
    ```
2. Navigate to the installer directory:
    ```
    cd ~/simple-hyprland/scripts/installer
    ```
3. Run the installation script with sudo:
    ```
    sudo sh install.sh
    ```
#### Important Notes:

- This script is user-centric and allows you to choose which components to install (Everything is asked, even for the core).
- While the script offers flexibility, it is recommend to installing all components for the best experience, as this is already a minimal setup.
- The installation process follows the same flow as the documentation, ensuring a structured and educational approach.
- Although designed for Arch Linux, users of Arch-based distributions may also find this script helpful.

> **Note for Newcomers**: Although this script enables rapid setup, it's highly recommended to read through the documentation for those new to Hyprland. Understanding each step will greatly enhance your ability to customize and troubleshoot your environment.


### Key Bindings 🎹

After installation, you'll want to familiarize yourself with the default key bindings. Here are some essential shortcuts to get you started:

#### General
- `Super + T`: Open the terminal (`$terminal`).
- `Super + B`: Open the browser (`$browser`).
- `Super + O`: Open notes application (`$notes`).
- `Super + C`: Open the primary editor (`$editor`).
- `Super + S`: Open the alternative editor (`$editor-alt`).
- `Super + F`: Open the file manager (`$fileManager`).
- `Super + A`: Open the application menu (`$menu`).
- `Super + M`: Exit Hyprland.

#### Window Management & Workspace Navigation
- `Super + Q`: Close the active window.
- `Super + W`: Toggle floating mode for the active window.
- `Super + J`: Toggle split mode in the Dwindle layout.
- `SUPER + [Arrow Keys]`: Move focus between windows
- `SUPER + SHIFT + [Arrow Keys]`: Move active window
- `SUPER + CTRL + [Arrow Keys]`: Resize active window
- `SUPER + [1-9]`: Switch to workspace 1-9
- `SUPER + SHIFT + [1-9]`: Move active window to workspace 1-9

#### Screen Brightness, Volume and Media Control
- `Brightness Up`: Increase the screen brightness by 5%.
- `Brightness Down`: Decrease the screen brightness by 5%.
- `Volume Up`: Increase the volume by 5%.
- `Volume Down`: Decrease the volume by 5%.
- `Mic Mute`: Mute the microphone.
- `Audio Mute`: Mute the audio.
- `Play/Pause`: Toggle play/pause for media.
- `Next Track`: Skip to the next track.
- `Previous Track`: Go back to the previous track.

#### Miscellaneous
- `SUPER + L`: Lock screen
- `Super + V`: Open the clipboard history and paste the selected item.
- `Super + P`: Open the color picker and copy the selected color to the clipboard.
- `Super + L`: Lock the screen.
- `Super + Escape`: Open the logout menu.
- `Ctrl + Escape`: Toggle the Waybar (kill if running, start if not).
- `Print Screen`: Take a screenshot of the entire screen and copy it to the clipboard.
- `Super + Print Screen`: Take a screenshot of the active window and copy it to the clipboard.
- `Super + Alt + Print Screen`: Select an area to take a screenshot and copy it to the clipboard.

Make sure to have applications installed corresponding to the binds. Feel free to customize these keybindings to better suit your needs. You can customize these and add more in your Hyprland configuration file (`~/.config/hypr/hyprland.conf`).

## Credits 🙏
Many configuration parts, themes, and scripts in this guide are sourced from the community. I extend my thanks to all contributors, especially the [Hyprland project](https://github.com/hyprwm/Hyprland) and other cool repositories like [hyprdots](https://github.com/prasanthrangan/hyprdots). If you find that credit has not been given where due, please feel free to open a Pull Request (PR).

## References 📖
* [Hyprland Wiki](https://wiki.hyprland.org/)
* [Hyprdots Repo](https://github.com/prasanthrangan/hyprdots)
* [Hyprland-titus Repo](https://github.com/ChrisTitusTech/hyprland-titus) and more.

Feel free to explore the documentation and contribute to this guide if you find any improvements or have suggestions. 🤝
