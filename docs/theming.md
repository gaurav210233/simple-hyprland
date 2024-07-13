# Theming, Look & feel 🎨✨
In this guide, we'll transform your Hyprland setup into a visually stunning environment by applying themes to various components. A well-themed desktop not only looks great but also enhances your workflow and overall user experience.

## Installing Essential Tools  🛠️

#### nwg-look
[nwg-look](https://github.com/nwg-piotr/nwg-look) simplifies the process of setting GTK themes, enabling a cohesive look across different toolkits.

##### Installation

```
pacman -S nwg-look
```

#### [qt5ct](https://github.com/desktop-app/qt5ct), [qt6ct](https://github.com/trialuser02/qt6ct), [Kvantum](https://github.com/tsujan/Kvantum/tree/master/Kvantum)
These tools are essential for managing and applying themes to QT5 and QT6 applications, ensuring a consistent appearance across your desktop environment.

##### Installation

```
pacman -S qt5ct qt6ct kvantum
```

##### Adding QT Environment Variables
We've already added the necessary QT environment variables during the basic configuration step.

## Installing themes and icons 🏞️
#### GTK Themes
Place the themes in the system theme directory. For this guide, we'll install the [Catppuccin theme](https://github.com/catppuccin/catppuccin) taken from [hyprdots](https://github.com/prasanthrangan/hyprdots) repo, a visually appealing option.

Extract the theme from the repos assets to the following location to apply it system-wide:

```
tar -xvf ~/simple-hyprland/assets/themes/Catppuccin-Mocha.tar.xz -C /usr/share/themes/
```

#### Icon Theme
Place the icon theme in the system icon directory. We'll install the [Tela icon theme](https://github.com/vinceliuice/Tela-icon-theme) also from hyprdots.

Extract the theme from our assets to the following location to apply it system-wide:

```
tar -xvf ~/simple-hyprland/assets/icons/Tela-circle-dracula.tar.xz -C /usr/share/icons/
```

#### Kvantum Theme
For Arch-based systems, install the kvantum-theme-catppuccin from the AUR:

```
yay -S kvantum-theme-catppuccin-git
```

## Setting the Themes 🖼️
1. Use `nwg-look` to set the global GTK and icon theme, and apply the changes.
2. Open the `kvantummanager` (with sudo to apply as root theme , "sudo -E kvantummanager"), select the desired theme, and apply it.
3. Open the `qt6ct` (QT6 Settings) and set the icon theme.
4. Optionally, you can change other settings like font size, cursor theme, etc.

By default all the configs we used in the previous tutorial are configured with catppuccin color theme.

## Theming applications 🖥️
At this stage, you might want to theme specific applications to achieve a uniform look across your desktop environment.

#### 1. Kitty: The terminal emulator
Copy the configuration files for the Catppuccin theme:

1. `kitty.conf` - Kitty configuration file
2. `theme.conf` - Theme file

```
cp -r ~/simple-hyprland/configs/kitty ~/.config/
```
#### 2. VS Code: The Code editor
Install the Catppuccin theme extension from the Visual Studio Code Marketplace.

#### 3. Dunst: Notification daemon
Copy the configuration file i.e. `dunstrc`.

```
cp -r ~/simple-hyprland/configs/dunst ~/.config/
```

## Misc 🔧
Some additional enhancements to elevate the overall feel and experience.

#### 1. Adding blur to the windows
We can achieve a blurred effect on windows by adding window rules in our hyprland.conf.

Example: To add blur to Kitty, add:

```
windowrulev2 = opacity 0.90 0.90,class:^(kitty)$
```

**Pro Tip:** 💡 To get the class_name for a specific window, use the command `hyprctl clients` while the window is open.

For more details refer [Hyprland Window Rules](https://wiki.hyprland.org/Configuring/Window-Rules/).

#### 2. Adding Animation and decorations
Animations and decorations can add a touch of flair to your desktop experience.

Add/Edit the following to your`hyprland.conf`.

```
animations {
    enabled = true
    bezier = wind, 0.05, 0.9, 0.1, 1.05
    bezier = winIn, 0.1, 1.1, 0.1, 1.1
    bezier = winOut, 0.3, -0.3, 0, 1
    bezier = liner, 1, 1, 1, 1
    animation = windows, 1, 6, wind, slide
    animation = windowsIn, 1, 6, winIn, slide
    animation = windowsOut, 1, 5, winOut, slide
    animation = windowsMove, 1, 5, wind, slide
    animation = border, 1, 1, liner
    animation = borderangle, 1, 30, liner, loop
    animation = fade, 1, 10, default
    animation = workspaces, 1, 5, wind
}

decoration {
    rounding = 10

    # Change transparency of focused and unfocused windows
    active_opacity = 1.0
    inactive_opacity = 1.0

    drop_shadow = true
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)

    blur {
        enabled = true
        size = 3
        passes = 3
        new_optimizations = true
        vibrancy = 0.1696
        ignore_opacity = true
    }
}
```
With these steps, you'll have a visually stunning and cohesive desktop environment tailored to your preferences. Remember, the true beauty of a desktop lies in the eye of the beholder, so feel free to experiment and find the perfect combination that resonates with your personal style. Immerse yourself in an aesthetic experience that not only delights the senses but also enhances your productivity and workflow. 🌟🖥️✨

**Next:** [Final](final.md) 👉
