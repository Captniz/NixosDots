{
  description = "Flake of captniz (aka Simone), inspired by librephoenix";

  inputs = {
    nixpkgs.url= "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";	
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let

      #? Took this configuration from librephoenix
      #? Probably I will change it in the future.
      #? For now ill just use it as a base and modify it as I need;
      #? Not everything is needed, but I will keep it for now.

      # ----- SYSTEM SETTINGS ----- #
      systemSettings = {
        system = "x86_64-linux";      # system arch
        hostname = "nixos";           # hostname
        profile = "default";          # select a profile defined from my profiles directory
        timezone = "Europe/Rome";     # select timezone
        locale = "it_IT.UTF-8";       # select locale
        bootMode = "uefi";            # uefi or bios
      };

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "simo";            # username
        theme = "testing";       # selcted theme from my themes directory (./themes/)
        wm = "hyprland";              # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
        # window manager type (hyprland or x11) translator
        wmType = if (wm == "hyprland") then "wayland" else "x11";
        browser = "firefox";          # Default browser; must select one from ./user/app/browser/
        term = "alacritty";           # Default terminal command;
        editor = "nvim";              # Default editor;
      };

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
	        system = systemSettings.system;
          modules = [ ./configuration.nix ];
          specialArgs = { 
            inherit systemSettings; 
            inherit userSettings;  
          };
        };
      };
      
      homeConfigurations = {
        simo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
      	  modules = [ ./home.nix ];
          extraSpecialArgs = { 
            inherit userSettings; 
          };
      	};
      };
    };
}
