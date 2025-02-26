
# NixOS Configuration <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [System Info](#system-info)
- [Directory Structure](#directory-structure)
- [Description](#description)
- [TODOS](#todos)
  - [Pending Packages](#pending-packages)
  - [Reminders](#reminders)

## System Info

## Directory Structure

```plaintext
.
│
├── hardware-configuration.nix  # Main hardware configuration file || Dont touch!
├── configuration.nix           # Main system configuration file
├── home.nix                    # Main home configuration file 
├── flake.nix                   # Flake file 
├── flake.lock                  # Lock file for the flake
├── README.md                   # This file
│
├── System                      # System general configuration files || Mainly managed by NixOS config
│   ├── App                     # System applications configuration
│   │   └── Sddm.nix            # ...
│   │
│   ├── Boot.nix                # Boot configuration
│   ├── EnVars.nix              # Environment variables
│   ├── Hardware.nix            # Hardware configuration
│   ├── Locale.nix              # Locale configuration
│   ├── Networking.nix          # Networking configuration
│   ├── PkgMan.nix              # Package manager configuration and insatlled packages
│   ├── ProgramSettings.nix     # Program settings and options
│   ├── Security.nix            # Security configuration
│   ├── Services.nix            # Services configuration
│   ├── Users.nix               # Users definitions and configuration
│   └── README.md               # README
│
└── User                        # User general configuration files || Mainly managed by Home Manager
    ├── App                     # User applications configuration    
    │   └── ...
    ├── ExtraConfigs            # Configurations for apps that can't be managed by Home Manager options
    │   └── ...
    ├── README.md               # README
    ├── Scripts                 # Custom scripts used by the configuration
    │   └── ...
    ├── Settings                # Other user specific settings
    │   └── ...
    └── Themes                  # User themes || Managed by Home Manager and flakes
        └── ... 
```

## Description

This is my personal configuration for NixOS, set up for my student laptop.  
I'm trying to keep the configuration as ordered as possible for my own taste, even tough it's not the best way to do it.

## TODOS

### Pending Packages

WIKI: [link](https://wiki.nixos.org/wiki/PostgreSQL)

| Package | Installato | Configurato |
| --- | --- | --- |
| Hyprland | ✔ | ✔ |
| Dunst | ✔ | ✔ |
| Obsidian | ✔ | ✔ |
| NeoVim | ✔ | ✔ |
| LibreOffice | ✔ | ✔ |
| Wine | ✔ | ✔ |
| Firefox (saved pssw and stting) | ✔ | ✔ |
| Alacritty | ✔ | ✔ |
| VScode | ✔ | ✔ |
| Git | ✔ | ✔ |
| GitCredentialManager | ✔ | ✔ |
| NMCli | ✔ | ✔ |
| Firacode / Nerdfonts | ✔ | ✔ |
| EWW | ✔ | ✔ |
| PavuControl | ✔ | ✔ |
| Pipewire | ✔ | ✔ |
| Nitch | ✔ | ✔ |
| BTop | ✔ | ✔ |
| ZSH / OhMyZSH | ✔ | ✔ |
| Starship | ✔ | ✔ |
| SWWW | ✔ | ✔ |
| Ranger | ✔ | ✔ |
| SDDM | ✔ | ✔ |
| Slurp / Grim | ✔ | ✔ |
| Bluetooth | ✔ | ✔ |
| Rofi | ✔ | ✔ |
| Nitch | ✔ | ✔ |
| Zathura | ✔ | ✔ |
| Qdirstat | ✔ | ✔ |
| Tesseract | ✔ | ✔ |
| Balena-etcher | ✔ | ✔ |
| Gparted | ✔ | ✔ |
| Docker | ✔ | ❌ |
| Lutris | ✔ | ✔ |
| Steam | ✔ | ✔ |
| Discord | ✔ | ✔ |
| Qimgv | ✔ | ✔ |
| fontforge | ✔ | ✔ |
| Dia | ✔ | ✔ |
| vlc | ✔ | ✔ |
| obs | ✔ | ✔ |
| Android studio | ✔ | ✔ |
| light | ✔ | ✔ |

### Reminders

- [ ] Create some usable themes
- [ ] Find a way to implement vs code extensions in the config
- [ ] Theme firefox
- [ ] Theme obsidian