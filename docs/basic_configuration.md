# Basic Configuration

Now that you've installed Hyprland and some essential software, it's time to configure your setup for optimal usability. This guide will help you configure key aspects of your system by editing the `hyprland.conf` file.

Open your config file and start editing with me.

### Monitor Configuration
The optimal monitor configuration is set up by default, but there are other options too, like setting the exact refresh rate and resolution, mirroring, and many more. Refer to the  [Hyprland Monitor Configuration Wiki](https://wiki.hyprland.org/Configuring/Monitors/) for detailed options and setups.

### User Programs
Define your frequently used programs for easy access:

```
# Set programs that you use
$terminal = kitty
$fileManager = dolphin
$browser = firefox
$editor = code
```

### Autostart Configuration
Autostart essential applications and services. We have already added Polkit in the previous step.
```
# Autostart necessary processes
exec-once=/usr/lib/polkit-kde-authentication-agent-1 # Polkit to manage passwords
# your other programs here
```
### Environment Variables
Set up environment variables to ensure compatibility and performance. You can keep these as they are, as you will need to configure them later.

```
# QT
env = QT_QPA_PLATFORM,wayland;xcb
env = QT_QPA_PLATFORMTHEME,qt6ct
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = QT_AUTO_SCREEN_SCALE_FACTOR,1
env = QT_STYLE_OVERRIDE,kvantum

# Toolkit Backend Variables
env = GDK_BACKEND,wayland,x11,*
env = SDL_VIDEODRIVER,wayland
env = CLUTTER_BACKEND,wayland

# XDG Specifications
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_TYPE,wayland
env = XDG_SESSION_DESKTOP,Hyprland
```
### Look and Feel
Adjust the appearance of your Hyprland environment. More details will be provided later, but for now, keep the settings basic.

Change things like gaps_in, gaps_out, border_size according to your comfort. You can keep them as they are, as you will change them later.

```
general { 
    gaps_in = 5
    gaps_out = 5
    border_size = 2
    col.active_border = rgb(8aadf4) rgb(24273A) rgb(24273A) rgb(8aadf4) 45deg
    col.inactive_border = rgb(24273A) rgb(24273A) rgb(24273A) rgb(27273A) 45deg
    resize_on_border = true
    allow_tearing = false
    layout = dwindle
}
```

### Input Configuration
Configure your input devices, including keyboard layouts and touchpad settings.
Most of the defaults will work, but you might want to change things like natural scroll, workspace swipe, etc.

```
input {
    kb_layout = us
    follow_mouse = 1
    sensitivity = 0

    touchpad {
        natural_scroll = true
    }
}

gestures {
    workspace_swipe = true
    workspace_swipe_fingers = 3
}
```

### Keybindings
Set up keybindings for efficient workflow management.
This will be important for now, as you do not have any application launcher, so you will need to remember the keybindings for some time (you will learn them eventually).

Try to make meaningful binds like T for terminal, B for browser, C for code, F for file manager, and Q for quit.

You might want to change the volume and brightness of your system. To do that, install the following software:

```
# Install brightnessctl to adjust brightness
pacman -S brightnessctl

# Install pamixer to handle volume
pacman -S pamixer
```
After installing the required software, add the following binds:
```
$mainMod = SUPER

bind = $mainMod, T, exec, $terminal
bind = $mainMod, B, exec, $browser
bind = $mainMod, C, exec, $editor
bind = $mainMod, Q, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, F, exec, $fileManager
bind = $mainMod, W, togglefloating,

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Volume and Media Control
bind = , XF86AudioRaiseVolume, exec, pamixer -i 5 
bind = , XF86AudioLowerVolume, exec, pamixer -d 5 
bind = , XF86AudioMicMute, exec, pamixer --default-source -m
bind = , XF86AudioMute, exec, pamixer -t
bind = , XF86AudioPlay, exec, playerctl play-pause
bind = , XF86AudioPause, exec, playerctl play-pause
bind = , XF86AudioNext, exec, playerctl next
bind = , XF86AudioPrev, exec, playerctl previous

# Screen brightness
bind = , XF86MonBrightnessUp, exec, brightnessctl s +5%
bind = , XF86MonBrightnessDown, exec, brightnessctl s 5%-
```
There are other binds you will add as you progress.

For more information on keybindings, visit the [Hyprland Keybindings Wiki](https://wiki.hyprland.org/Configuring/Binds/).

Now your minimal system is ready, and you can start using Hyprland. Further comes the most beautiful part, like adding status bars, adding launchers, wallpaper utilities, etc., so continue with me.