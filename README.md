<h1 align="center"><b>[Hyprland] NixOs dot files</b></h1>

## Table of Contents <!-- omit in toc -->

- [Description](#description)
- [Directory Structure](#directory-structure)
- [TODOS](#todos)
  - [Resources](#resources)
  - [Reminders](#reminders)

## Description

This is my personal configuration for NixOS, designed specifically for my university laptop.  
I'm trying to keep the configuration as clean and bloat-free as possible, while still being able to manage all the software I need.

I'm also trying to avoid using performance-heavy or purely aesthetic software, to avoid being distracted or performace-impaired by it while working.

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
│   │   ├── XdgOptions.nix      # XDG options (e.g. default applications) 
│   │   ├── Style.nix           # User style configuration
│   │   └   ...
│   ├── Themes                  # User themes || Managed by Home Manager and flakes
│   │   └── ... 
│   └── README.md               # README
│
└── README.md                   # This file
```

## TODOS

### Resources

WIKI: [link](https://wiki.nixos.org/wiki/PostgreSQL)

HYPR Ecosystem: [link](https://wiki.hypr.land/Hypr-Ecosystem/)

### Reminders

- [ ] Cerca di rendere tutto dichiarativo
  - [ ] Cartelle della home
  - [ ] Sfondi
  - [ ] Etc....
- [ ] Find a way to implement vscode extensions in the config
- [ ] Theme obsidian | [Nuove settings](https://mynixos.com/search?q=obsidian)
- [ ] Implementa meglio cider, metti i tasti multimedia, metti il titolo della cazone corrente
- [ ] Risolvi i problemi legati al secondo monitor (MonitorSwitcher.sh non funziona)
- [ ] implementa [quickshell](https://quickshell.org/docs/v0.2.0/types/)  
- [ ] [Controlla AGS](https://aylur.github.io/ags/)  
- [ ] Finisci i temi css
- [ ] Sposta tutto quello che ha senso spostare in home manager al posto che in nixos (sistema -> user)
- [ ] Clipboard integration (anchedmenu+bash)
- [ ] Crea un menu a lista con tasto destro per varie opzioni
- [ ] Automount USB drives with udisks2 + udiskie
  - [ ] Nel menu metti anche una serie di cheatsheets per le hotkey tipo Omarchy (yazi,zathura,hyprland,firefox,vim,zsh)
- [ ] Aggiorna gli hash delle varie app con il flake 
- [ ] Fai una history delle notifiche (dunst)
- [ ] Aggiungi una scorciatoia per catturare screenshot di porzioni di schermo e editarle dopo / stessa osa per registrare lo schermo