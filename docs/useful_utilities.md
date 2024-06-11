# Enhancing Your Hyprland Environment

This section guides you through the installation and configuration of essential utilities that will elevate your Hyprland experience, augmenting both functionality and aesthetics. We'll cover status bars, application launchers, clipboard managers, and more, providing concise configuration snippets directly from my setup.

**Pro Tip:** In your hyprland.conf, organize similar configurations together, such as variables, exec-once statements, and keybindings, for better readability and maintainability.


#### 1. Status Bar: Waybar
Waybar provides real-time system information at a glance, ensuring you stay informed about your system's status.

##### Installation

```
pacman -S waybar
```

##### Configuration
Customize the appearance and behavior of the status bar by modifying the following files:
1. `~/.config/waybar/config.jsonc` - tFormat and structure the bar.
2. `~/.config/waybar/style.css` - Style and theme the bar.

It will use some default configuration, you can copy my configuration files:

```
cp ~/Simple-Hyprland/configs/waybar ~/.config/
```

**Note:** Note: Remember to reload the bar to apply any configuration changes.

##### Hypr
Add the following keybinding to reload the bar:

```
bind = Ctrl, Escape, exec, killall waybar || waybar
```

Autostart the bar with:

```
exec-once=waybar
```

#### 2. App Launcher: Tofi
Tofi offers a minimalistic, Wayland-native application launcher for efficient application access.

##### Installation

```
yay -S tofi
```

##### Configuration
Customize the appearance and behavior of the launcher by modifying the configuration file:

`~/.config/tofi/` - The configuration directory.

You can copy my pre-configured files:

```
cp ~/Simple-Hyprland/configs/tofi ~/.config/tofi
```

##### Hypr
Keybinding to launch the application menu:

```
bind = $mainMod, A, exec, $menu
```

Define the launcher command and configuration path:

```
$menu = tofi-drun -c ~/.config/tofi/configA --drun-launch=true
```

#### 3. Clipboard Manager:  Cliphist
Cliphist enables you to keep track of your clipboard history, enhancing productivity when working with multiple pieces of information.

##### Installation
To install cliphist, use the following command:

```
pacman -S cliphist
```

##### Configuration
No specific configuration is needed.

##### Hypr
Keybinding to access the clipboard history:

```
bind = SUPER, V, exec, cliphist list | tofi -c ~/.config/tofi/configV | cliphist decode | wl-copy
```

Autostart the clipboard manager:

```
exec-once = wl-paste --type text --watch cliphist store
exec-once = wl-paste --type image --watch cliphist store
```

#### 4. Wallpaper: Swww
Swww allows you to set and manage your desktop background, enhancing the visual appeal of your workspace.

##### Installation
To install `swww`, use the following command:

```
yay -S swww
```

##### Configuration
Copy sample wallpapers (creates the assets folder inside .config):

```
cp ~/Simple-Hyprland/assets/backgrounds ~/.config/assets
```

No specific configuration is needed.

##### Hypr
Initialize the wallpaper daemon and set a wallpaper on startup:

```
exec-once = swww init
exec-once = swww img ~/.config/assets/backgrounds/cat_leaves.png  --transition-fps 255 --transition-type outer --transition-duration 0.8
```

You can also set the keybinding to change the wallpaper :

```
bind = SUPER, N, exec, swww img ~/.config/assets/backgrounds/dark-cat-rosewater.png  --transition-fps 255 --transition-type outer --transition-duration 0.8 # Change wallpaper
```

#### 5. Color Picker: Hyprpicker
Hyprpicker allows you to select colors directly from your screen, a handy tool for design and development tasks.

##### Installation

```
pacman -S hyprpicker
```

##### Configuration
No specific configuration is needed for hyprpicker.

##### Hypr
Define a variable for the color picker and a keybinding to launch it:

```
$colorPicker = hyprpicker
bind = SUPER, P, exec, $colorPicker | wl-copy
```

#### 6. Screen Locker: Hyprlock
A screen locker secures your computer when you are away, preventing unauthorized access.

##### Installation
Install hyprlock, which is designed to work well with Hyprland.

```
yay -S hyprlock
```
##### Configuration
Customize the screen locker by modifying the configuration file: `~/.config/hypr/hyprlock.conf`

You can copy my configuration file:

```
cp ~/Simple-Hyprland/configs/hypr/hyprlock.conf ~/.config/hypr/
```

##### Hypr
Keybinding to lock the desktop:

```
bind = SUPER, L, exec, hyprlock
```

#### 7. Idle Manager: Hypridle
Hypridle automatically locks your screen or takes other actions when your system is idle, enhancing security and power management.

##### Installation
To install hypridle, use the following command:

```
yay -S hypridle
```

##### Configuration
Customize the idle manager behavior by modifying the configuration file: `~/.config/hypr/hypridle.conf`

You can copy my configuration file:

```
cp ~/Simple-Hyprland/configs/hypr/hypridle.conf ~/.config/hypr/
```

##### Hypr
No specific keybindings or variables are needed for hypridle.


Autostart the idle manager:
```
exec-once = hypridle
```


#### 8. Logout Menu: Wlogout
Wlogout provides a convenient way to log out, restart, or shut down your system.


##### Installation

```
pacman -S wlogout
```

##### Configuration
Customize the appearance and behavior of the logout menu by modifying the following files:
1. `~/.config/wlogout/layout` - Format and structure the menu.
2. `~/.config/wlogout/style.css` - Style and theme the menu.

It will use some default configuration, You can copy my pre-configured files:

```
cp ~/Simple-Hyprland/configs/wlogout ~/.config/
cp ~/Simple-Hyprland/configs/assets/wlogout ~/.config/assets # copying assets
```

##### Hypr
Keybinding to launch the logout menu:

```
bind = SUPER, ESCAPE, exec, wlogout
```

#### 9. Taking Screenshots: Grimblast
Grimblast is a script that wraps around grim and slurp, providing enhanced functionality for capturing screenshots.

##### Installation

```
yay -S grimblast
```

##### Configuration
No specific configuration is needed for grimblast.

##### Hypr
Keybindings for capturing screenshots:

```
# add --cursor flag to include cursor also, --freeze flag to freeze before selection

# Entire screen + clipboard copy
bind = , Print, exec, grimblast --notify copysave screen 

# current Active window only + clipboard copy
bind = SUPER, Print, exec, grimblast --notify copysave active 

# Select area to take screenshot
bind = SUPER ALT, Print, exec, grimblast --notify copysave area 
```

With these utilities configured, your Hyprland environment now boasts enhanced functionality, aesthetics, and user experience, tailored to your preferences and workflow.