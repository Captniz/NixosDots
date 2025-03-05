
# NixOS Configuration <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [Description](#description)
- [Directory Structure](#directory-structure)
- [TODOS](#todos)
  - [Pending Packages](#pending-packages)
  - [Reminders](#reminders)

## Description

This is my personal configuration for NixOS, designed specifically for my university laptop.  
I'm trying to keep the configuration as clean and bloa-free as possible, while still being able to manage all the software I need.

I'm also trying to avoid using performance-heavy or purely aesthetic software, to avoid being distracter or performace-impaired by it while working.


## Directory Structure

```plaintext
.
│
├── hardware-configuration.nix  # Main hardware configuration file || Dont touch!
├── configuration.nix           # Main system configuration file
├── home.nix                    # Main home configuration file 
├── flake.nix                   # Flake file 
├── flake.lock                  # Lock file for the flake
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
├── User                        # User general configuration files || Mainly managed by Home Manager
│   ├── App                     # User applications configuration    
│   │   └── ...
│   ├── ExtraConfigs            # Configurations for apps that can't be managed by Home Manager options
│   │   └── ...
│   ├── Scripts                 # Custom scripts used by the configuration
│   │   └── ...
│   ├── Settings                # Other user specific settings for home configuration
│   │   ├── HomePkg.nix         # HomeManager installed packages 
│   │   ├── Style.nix           # User style configuration
│   │   └   ...
│   ├── Themes                  # User themes || Managed by Home Manager and flakes
│   │   └── ... 
│   └── README.md               # README
│
└── README.md                   # This file
```

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
| Firefox | ✔ | ✔ |
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
| Yazi | ✔ | ✔ |
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

- [ ] Find a way to implement vs code extensions in the config
- [ ] Theme obsidian