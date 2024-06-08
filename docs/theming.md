# Theming
In this guide, I will help you transform your Hyprland setup into a visually stunning environment by theming various components. A well-themed desktop not only looks great but also improves your workflow and user experience.

### Installing Essential Tools

#### nwg-look
nwg-look is a tool that simplifies the process of setting GTK themes, making it easier to achieve a cohesive look across different toolkits.

##### Installation
To install nwg-look, use the following command:

```
pacman -S nwg-look
```
#### qt5ct, qt6ct, Kvantum
These tools are essential for managing and applying themes to QT5 and QT6 applications, ensuring a consistent appearance across your desktop environment.

##### Installation
To install qt5ct, qt6ct, and Kvantum, use the following commands:

```
pacman -S qt5ct qt6ct kvantum
```
##### Adding QT Environment Variables
We already added while doing basic configuration

### Installing themes and icons

#### GTK Themes

Place the Catppuccin themes in the system theme directory:

```
sudo cp -r /path/to/catppuccin/themes /usr/share/themes
```
#### Icon Theme

Place the Tela icons in the system icon directory:

```
sudo cp -r /path/to/tela/icons /usr/share/icons
```
#### Kvantum Theme

For Arch-based systems, install the kvantum-theme-catppuccin from AUR:
```
yay -S kvantum-theme-catppuccin
```

### Setting the Themes
1. Use nwg-look to set the global  and icon theme and apply it.
2. Open Kvantum Manager and select the Catppuccin theme and apply it.
3. Open QT6 Settings and set the icon theme to Tela.

There are other things too you can change like font size etc.



