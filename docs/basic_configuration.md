# Basic Configuration 🛠️

Having installed Hyprland and essential system components, we now proceed to configure basics of your environment for optimal functionality and efficiency. This section will guide you through the configuration of key aspects by modifying the `hyprland.conf` file.

Navigate to your configuration file and commence editing.

#### 1. Monitor Configuration 🖥️
The default monitor configuration is optimized for most setups. However, for advanced configurations such as setting precise refresh rates, resolutions, or mirroring displays, refer to the [Hyprland Monitor Configuration Wiki](https://wiki.hyprland.org/Configuring/Monitors/).

#### 2. User Programs 📚
Define frequently used applications for rapid access:

```
# Define primary applications
$terminal = kitty
$fileManager = dolphin
$browser = brave-browser
$editor = code
```

#### 3. Autostart Configuration 🚀
Autostart critical applications and services. We have previously configured Polkit and dunst daemon for autostart.

```
## Autostart essential processes
exec-once=/usr/lib/polkit-kde-authentication-agent-1 # Polkit for privilege management
exec-once=/usr/bin/dunst
# Additional autostart entries
```

#### 4. Environment Variables 🌍
Configure environment variables to ensure compatibility and performance. You can copy and paste these as it is, as anyway you will need to configure them later.

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
#### 5. Look and Feel 🎨
Adjust the appearance and behavior of your Hyprland environment. Detailed customization will be covered in subsequent sections.

Change things like `gaps_in, gaps_out, border_size, resizing_on_border`, etc. according to your comfort. 

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

#### 6. Input Configuration ⌨️🖱️
Configure input devices, including keyboard layouts and touchpad settings:

Most of the defaults will work, but you might want to change things like `natural_scroll, workspace_swipe`, etc.

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

#### 7. Keybindings ⌨️
Configure keybindings for efficient workflow management. Note that these bindings are crucial as we haven't yet configured an application launcher.

**Pro Tip:** 💡 Try to make meaningful binds like T for terminal, B for browser, C for code, F for file manager, and Q for quit.

You might want to change the volume and brightness of your system. To do that, install the following software:

```
# Brightness control
pacman -S brightnessctl

# Volume control
pacman -S pamixer
```

After installing the utilities, add the following bindings:

```
$mainMod = SUPER

bind = $mainMod, T, exec, $terminal
bind = $mainMod, B, exec, $browser
bind = $mainMod, C, exec, $editor
bind = $mainMod, Q, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, F, exec, $fileManager
bind = $mainMod, W, togglefloating,


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
We will add more binds as we progress.

For comprehensive keybinding documentation, refer to the [Hyprland Keybindings Wiki](https://wiki.hyprland.org/Configuring/Binds/).

With your minimal Hyprland environment now operational, we're poised to elevate it from functional to phenomenal. In the following sections, we'll supercharge your setup with sleek status bars, lightning-fast application launchers, and dynamic wallpaper utilities. Brace yourself for a deep dive into advanced customization that will transform your desktop into a powerhouse of aesthetics and efficiency. The groundwork is laid; now it's time to unleash the full potential of your Hyprland environment. 🚀✨

**Next:** [Useful Utilities](useful_utilities.md) 👉