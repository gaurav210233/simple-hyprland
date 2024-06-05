# Useful Utilities
In this tutorial, I will guide you through the installation and configuration of various essential tools such as status bars, clipboard managers, app launchers, and more. These utilities will enhance the usability of your Hyprland setup. Additionally, I will provide configurations that you can copy directly from my setup.

### Status Bars
A status bar provides a quick and convenient way to view system information such as time, date, battery level, network status, and more. It helps you stay informed about your system's state at a glance.

##### Installation
For this tutorial, we will use waybar, which is commonly used and has many features.
To install waybar, use the following command:
```
pacman -S waybar
```
##### Configuration
It will use some default configuration, you can copy my configuration files to get bar like this:

```
cp my_config_path ~/.config/waybar
```

##### Keybinds
Add the following keybinding to your Hyprland config:

```
bind = Ctrl, Escape, exec, killall waybar || waybar
```

### Clipboard Manager
A clipboard manager allows you to keep track of your clipboard history, making it easier to access previously copied items. This is particularly useful for improving productivity when working with multiple pieces of information.

##### Installation
For this tutorial, we will use wl-clipboard and cliphist, which are well-integrated with Wayland and offer robust features.
To install wl-clipboard and cliphist, use the following command:

```
pacman -S wl-clipboard cliphist
```
##### Configuration
Add the following to your Hyprland config for clipboard management:

```
exec-once = wl-paste --type text --watch cliphist store
exec-once = wl-paste --type image --watch cliphist store
```
Refer to my configuration [here]().

##### Keybinds
Add the following keybinding to your Hyprland config:

```
bind = SUPER, V, exec, cliphist list | tofi -c ~/.config/tofi/configV | cliphist decode | wl-copy

```
### App Launchers
An app launcher provides a quick and efficient way to launch applications without needing to navigate through menus. It can significantly speed up your workflow by reducing the time spent searching for applications.

##### Installation
For this tutorial, we will use tofi, which is well-suited for Wayland and offers extensive customization options.

To install tofi, use the following command:
```
yay -S tofi
```
##### Configuration
Copy my configuration into `~/.config/tofi/configA`:

```
cp my_config_path ~/.config/tofi/configA
```
##### Keybinds
Add the following keybinding to your Hyprland config:

```
bind = $mainMod, A, exec, $menu
```

### Wallpaper
A wallpaper utility allows you to set and manage your desktop background, enhancing the visual appeal of your workspace.

##### Installation
For this tutorial, we will use `swww`, which is commonly used with Wayland.
To install `swww`, use the following command:

```
yay -S swww
```
##### Configuration
Add the following to your Hyprland config to set a wallpaper:

```
exec-once = swww init
exec-once = set wallpaper here
```
Refer to my configuration here.

##### Keybinds
Add the following keybinding to your Hyprland config for changing wallpapers:

```
bind = SUPER, W, exec, swaybg -i /path/to/another/wallpaper.jpg # Change wallpaper
```
### Color Picker
A color picker is useful for selecting colors directly from your screen, which is helpful for design and development tasks.

##### Installation
For this tutorial, we will use wlr-randr and hyprpicker, which are well-integrated with Wayland.
To install hyprpicker, use the following command:

```
pacman -S hyprpicker
```
##### Configuration
No specific configuration is needed for hyprpicker.

##### Keybinds
Add the following keybinding to your Hyprland config:

```
bind = SUPER, P, exec, hyprpicker
```

### Screen Locker
A screen locker secures your computer when you are away, preventing unauthorized access.

##### Installation
For this tutorial, we will use hyprlock, which is designed to work well with Hyprland.
To install hyprlock, use the following command:

```
yay -S hyprlock
```
##### Configuration
No specific configuration is needed for hyprlock.

##### Keybinds
Add the following keybinding to your Hyprland config:

```
bind = SUPER, L, exec, hyprlock
```
### Idle Manager
An idle manager can automatically lock your screen or take other actions when your system is idle, enhancing security and power management.

##### Installation
For this tutorial, we will use hypridle, which is designed for Hyprland.
To install hypridle, use the following command:

```
yay -S hypridle
```
##### Configuration
Add the following to your Hyprland config to manage idleness:
```
exec-once = hypridle -l hyprlock
```
Refer to my configuration here.

##### Keybinds
No specific keybindings are needed for hypridle.


### Logout Menu
A logout menu provides a convenient way to log out, restart, or shut down your system.

##### Installation
For this tutorial, we will use wlogout, which is a Wayland-native logout utility.
To install wlogout, use the following command:

```
pacman -S wlogout
```
##### Configuration
Create a configuration file at ~/.config/wlogout/config with the following content:

Refer to my configuration here.

##### Keybinds
Add the following keybinding to your Hyprland config:

```
bind = SUPER, Shift, Q, exec, wlogout
```

### Taking Screenshots
A screenshot tool allows you to capture your screen, which is useful for documentation, sharing information, and troubleshooting.

##### Installation
For this tutorial, we will use grimblast, which is a script that wraps around grim and slurp for enhanced screenshot functionality.
To install grimblast, use the following command:

```
yay -S grimblast
```
##### Configuration
No specific configuration is needed for grimblast.

##### Keybinds
Add the following keybindings to your Hyprland config:

```
# Fullscreen screenshot
bind = SUPER, Print, exec, grimblast save active ~/Pictures/screenshot-$(date +%F-%T).png

# Selective screenshot
bind = SUPER, Shift, Print, exec, grimblast save area ~/Pictures/screenshot-$(date +%F-%T).png
```
By following this guide, you will have a fully functional and efficient Hyprland setup with all the essential utilities.