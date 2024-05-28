# System

## Description

> Group of config files containing the system settings, separated by category.
> They are then imported into the main configuration file ( `../configuration.nix` ).

## Files

### PkgMan.nix 
Contains the package manager settings and all the currently installed packages ( _excluding fonts and themes_ ).
### Hardware.nix 
Contains the custom hardware settings, different from the `hardware-configuration.nix` ones.
### EnVars.nix 
Contains the system environment variables.
### Locale.nix 
Contains the system locale settings such as language and time.
### Services.nix 
Contains the system services settings.
### ProgramSettings.nix 
Contains system-wide settings related to programs, *such as the default shell or the default mime-types*.