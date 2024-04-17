{ config, pkgs, ... }:

{
  # Home config
  home.username = "simo";
  home.homeDirectory = "/home/simo";
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };
  
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Programs & configs
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      
      # Vars
      "$mod" = "SUPER";
      
      monitor = ",preferred,auto,1";

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        no_border_on_floating = true;
        cursor_inactive_timeout = 3;
        layout = "dwindle";
      };

      misc = {
        disable_hyprland_logo = true;
      };

      gestures = {
        workspace_swipe = true;
      };
      
      input = {
        kb_layout = "it";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = "yes";
		      middle_button_emulation = true;
        };
      };

      decoration = {
        active_opacity = 0.85;
        inactive_opacity = 0.85;
        drop_shadow = true;
        shadow_range = 5;
        shadow_render_power = 3;
        blur = {
          enabled = true;
          size = 9;
          new_optimizations = true;
          passes = 3;
          ignore_opacity = true;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      bind = [
        # Lauchers
        "$mod, RETURN, exec, alacritty"
        "$mod, R, exec, rofi -show drun"
        "$mod, F, exec, firefox"
        "$mod, A, exec, code"
        "$mod, Q, exec, obsidian"
        "$mod, S, exec, grim -g \"$(slurp)\""
        "$mod, E, exec, alacritty -e ranger"
        "$mod, W, exec, alacritty -e bpytop"

        # Window managment
        "$mod, J, togglesplit,"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, C, killactive,"
        "$mod, V, togglefloating,"
        "$mod, SPACE, fullscreen"
        "$mod, M, exit,"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
  
        # Move active window to a workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];
      
      bindm = [
        # Move/resize windows
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];


      windowrulev2 = [
        "opaque,class:^(firefox)$"
        "opaque,class:^(mirage)$"
        "float,class:^(Eww)$"
        "tile,class:^(notion-snap-reborn)$"
        "tile,class:^(notion-snap-reborn)$"
        "suppressevent maximize,class:^(notion-snap-reborn)$"
        "noanim,class:^(ueberzugpp_[A-Za-z0-9]+)$"
        "fakefullscreen,class:^(jetbrains-[A-Za-z0-9]+)$"
      ];

      exec-once = "swww init & swww img ~/Images/Wallpapers/100.png";
    };
  };  

  gtk.enable = true;
  
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#555555";
        frame_width = 2;
        geometry = "500x5-5+30";
        horizontal_padding = 8;
        markup = "full";
        padding = 8;
        separator_color = "frame";
        separator_height = 2;
        transparency = 10;
        word_wrap = true;
      };

      urgency_low = {
        background = "#1d1f21";
        foreground = "#4da1af";
        frame_color = "#4da1af";
        timeout = 10;
      };

      urgency_normal = {
        background = "#1d1f21";
        foreground = "#70a040";
        frame_color = "#70a040";
        timeout = 15;
      };

      urgency_critical = {
        background = "#1d1f21";
        foreground = "#dd5633";
        frame_color = "#dd5633";
        timeout = 0;
      };

    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Simone Tardiani";
      userEmail = "simone.tardiani.imp@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
      };
    }
    zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      shellAliases = {
        clr = "clear";
        flakeup = "nix flake update /etc/nixos";
        homeup = "home-manager switch --flake /etc/nixos";
        nixup = "sudo nixos-rebuild switch";
        nixconfigure = "code /etc/nixos";
        nixdeleteolder = "sudo nix-collect-garbage --delete-older-than";
      };
    };
  };
}
