# User

## Description

> Group of config files containing the user specific settings for every application and custom scripts.
> They are then imported into the main configuration file ( `../../home.nix` ).

## Directories

### App

Contains the configuration of all the applications installed on the system; each app configuration is stored in a different file.

### Scripts

Custom scripts of the user.

### Settings

Contains the user settings for the system, separated by category.

#### Style.nix

Contains the user style settings, such as the theme and the icons and the imports of the style-related packages.

*!THIS FOLDER MIGHT GET DELETED IN THE FUTURE!*

### Themes

Contains the user themes for the system, separated
into different folders.

### ExtraConfigs

Contains the extra configurations of the applications, used when an app doesn't have the proper settings available in the home-manager configuration options  

For instance `ranger` doesn't have a great interaction with home-manager so it's stored in this folder and then imported and managed through `home.file.<name>.source` in his settings ( `App/Ranger.nix` ).
