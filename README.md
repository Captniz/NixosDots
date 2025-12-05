<h1 align="center"><b>[Hyprland] NixOs dot files</b></h1>

## Table of Contents <!-- omit in toc -->

- [Description](#description)
- [Directory Structure](#directory-structure)
- [TODOS](#todos)
  - [Resources](#resources)
  - [Reminders](#reminders)
    - [Generali](#generali)
    - [Da renedere dichiarativo](#da-renedere-dichiarativo)
    - [Features](#features)
    - [Temi](#temi)

## Description

This is my personal configuration for NixOS, designed specifically for my university laptop.  
I'm trying to keep the configuration as clean and bloat-free as possible, while still being able to manage all the software I need.

I'm also trying to avoid using performance-heavy or purely aesthetic software, to avoid being distracted or performace-impaired by it while working.

## Directory Structure

```plaintext
./
│
├── hardware-configuration.nix  # Main hardware configuration file || Dont touch!
├── configuration.nix           # Main system configuration file
├── home.nix                    # Main home configuration file 
├── flake.nix                   # Flake file 
├── flake.lock                  # Lock file for the flake
│
├── System                      # System general configuration files || Mainly managed by NixOS config
│   ├── App                     # System applications configuration
│   │   ├── App-settigs.nix     # File that imports all the app settings
│   │   └── ...
│   │
│   ├── Hardware                # System hardware settings 
│   │   ├── Hardware-sett...    # File that imports all the hardware settings
│   │   ├── Audio.nix           # Audio hardware configuration
│   │   ├── Video.nix           # Video and display hardware configuration
│   │   ├── Power.nix           # Power management and sleep behaviour configuration
│   │   ├── Bluetooth.nix       # Bluetooth configuration
│   │   ├── Networking.nix      # Network and wifi hardware configuration
│   │   └── FileSystem.nix      # File systems and mounts configuration
│   │
│   ├── Boot.nix                # Boot configuration
│   ├── EnVars.nix              # Environment variables
│   ├── Locale.nix              # Locale configuration
│   ├── Networking.nix          # Networking configuration
│   ├── PkgMan.nix              # Package manager configuration and insatlled packages
│   ├── Security.nix            # Security configuration
│   └── Users.nix               # Users definitions and configuration
│
├── User                        # User general configuration files || Mainly managed by Home Manager
│   ├── App                     # User applications configuration    
│   │   └── ...
│   ├── Scripts                 # Custom scripts used by the configuration
│   │   └── ...
│   ├── Settings                # Other user specific settings for home configuration
│   │   ├── HomeFolder.nix      # User home folder configuration
│   │   ├── MimeTypes.nix       # User mime types configuration  
│   │   ├── Style.nix           # User style configuration
│   │   └   ...
│   └── Themes                  # User themes || Managed by Home Manager and flakes
│       └── ... 
│
└── README.md                   # This file
```

## TODOS

### Resources

WIKI: [link](https://wiki.nixos.org/wiki/PostgreSQL)

HYPR Ecosystem: [link](https://wiki.hypr.land/Hypr-Ecosystem/)

### Reminders

#### Generali

- [ ] Cerca di rendere tutto dichiarativo
  - [ ] Cartelle della home
  - [ ] Cartella Sfondi
  - [ ] Etc....
- [ ] Aggiorna gli hash delle varie app con il flake (aggiorna tutti gli hash che trovi sparsi nelle config)
- [ ] Guarda la wiki di hyprland (aggiornata spesso)
- [ ] Aggiorna il sistema
- [ ] Merge con la branch main

#### Da renedere dichiarativo

- [ ] Obsidian | [Nuove settings](https://mynixos.com/search?q=obsidian)

#### Features

- [ ] Fai una history delle notifiche
- [ ] Implementa meglio cider
  - [ ] Implementa i tasti multimedia
  - [ ] Crea menù multimedia
- [ ] Risolvi i problemi legati al secondo monitor (MonitorSwitcher.sh non funziona)
- [ ] Crea un menu con Rofi che mostra una cheatsheets per le hotkey della finestra attiva tipo Omarchy (yazi,zathura,hyprland,firefox,vim,zsh)

#### Temi

- [ ] Finisci i temi
- [ ] Crea un modo veloce per cambiare i temi (quantomento ligh/dark)
