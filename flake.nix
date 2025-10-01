{
  description = "Flake of Captniz (aka Simone), inspired by librephoenix";

  inputs = {
    # Base Inputs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Additional Packages
    hyprland-qtutils = {
      url = "github:hyprwm/hyprland-qtutils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      # Base Inputs
      self,
      nixpkgs,
      home-manager,
      
      ...
    }@inputs:
    let

      #? Took this configuration from librephoenix
      #? Probably I will change it in the future.
      #? For now ill just use it as a base and modify it as I need;
      #? Not everything is needed, but I will keep it for now.

      # ----- SYSTEM SETTINGS ----- #
      systemSettings = rec {
        system = "x86_64-linux"; # system arch
        hostname = "nixos"; # hostname
        profile = "default"; # select a profile defined from my profiles directory
        timezone = "Europe/Rome"; # select timezone
        locale = "it_IT.UTF-8"; # select locale
        bootMode = "uefi"; # uefi or bios
        keyboard = "it"; # select keyboard layout
      };

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        keyboard = systemSettings.keyboard; # select keyboard layout
        username = "simo"; # username
        theme = "Gruvbox-Dark"; # selcted theme from my themes directory (./themes/)
        wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
        # window manager type (hyprland or x11) translator
        wmType = if (wm == "hyprland") then "wayland" else "x11";
        browser = "firefox"; # Default browser; must select one from ./user/app/browser/
        term = "alacritty"; # Default terminal command;
        editor = "nvim"; # Default editor;
      };

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};

    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          system = systemSettings.system;
          modules = [ ./configuration.nix ];
          specialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };

      homeConfigurations = {
        simo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
          extraSpecialArgs = {
            inherit userSettings;
            inherit inputs;
          };
        };
      };
    };
}
