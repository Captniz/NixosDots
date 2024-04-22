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
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

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
      "$wallpaper" = "99.png";
      
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
        "$mod, W, exec, alacritty -e btop"

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

      exec-once = "swww init & swww img ~/Images/Wallpapers/$wallpaper";
    };
  };  

  gtk.enable = true;
  
  services.dunst = {
    enable = true;
    settings = {
      global = {
        # Color
        frame_color = "#555555";
        separator_color = "frame";
        transparency = 10;
        # Text
        word_wrap = true;
        markup = "full";
        progress_bar= true;
        # Shape
        frame_width = 2;
        separator_height = 2;
        horizontal_padding = 8;
        padding = 8;
        geometry = "500x5-5+30";
        # Position
        alignment = "center";
        origin = "top_right";
        offset = "(10,10)";
        sort = "update";
        stack_duplicates = true;
        show_indicators = true;
        # Xwayland
        layer = "top";
        #force_xwayland = true;
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
    home-manager= {
      enable = true;
    };

    zathura = {
      enable = true;
      options = {
        adjust-open = "best-fit";

        pages-per-row = 1;

        scroll-page-aware = true;
        smooth-scroll = true;
        scroll-full-overlap = "0.01";
        scroll-step = 100;

        zoom-min = 10;
        guioptions = "s";

        # zathurarc-color
        #font = "Firacode Bold 10";
        #default-bg = "#FDF6E3";
        #default-fg = "#5C6A72";

        #statusbar-bg = "#FDF6E3";
        #statusbar-fg = "#93B259";

        #inputbar-bg = "#FDF6E3";
        #inputbar-fg = "#93B259";

        #notification-error-bg = "#FDF6E3";
        #notification-error-fg = "#F57D26";

        #notification-warning-bg = "#FDF6E3";
        #notification-warning-fg = "#E66868";

        #highlight-color ="#8DA101";
        #highlight-active-color ="#DFA000";

        #completion-highlight-bg = "#FDF6E3";
        #completion-highlight-fg = "#93B259";

        #completion-bg = "#FDF6E3";
        #completion-fg = "#93B259";

        #notification-bg = "#FDF6E3";
        #notification-fg = "#93B259";

        recolor = false;
        recolor-lightcolor = "#FDF6E3";
        recolor-darkcolor ="#5C6A72";
        recolor-reverse-video = true;
        recolor-keephue = true;

        render-loading= false;
      };
    };

    git = {
      enable = true;
      userName = "Simone Tardiani";
      userEmail = "simone.tardiani.imp@gmail.com";
      lfs.enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
        credential.helper = "oauth";
        pull.rebase = false;
      };
    };
    
    zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      shellAliases = {
        clr = "clear";
        gacp = "git add * ; git commit --all -m '.' ; git push --all";
        flakeup = "nix flake update /etc/nixos";
        homeup = "home-manager switch --flake /etc/nixos";
        nixup = "sudo nixos-rebuild switch";
        nixconfigure = "code /etc/nixos";
        nixdeleteolder = "sudo nix-collect-garbage --delete-older-than";
      };
    };

    ranger = {
      enable = true;
      #rifle.image.condition = "X, flag f = sxiv -- \"$@\"";
    };
    
    vscode= {
      enable = true;
      userSettings = {
        # General
        "files.autoSave" = "afterDelay";
        "editor.formatOnSave"= true;
        "editor.codeActionsOnSave"= {};
        "update.mode"= "none";
        
        # Themeing
        "editor.cursorSmoothCaretAnimation"= "on";
        "workbench.colorTheme"= "Gruvbox Material Dark";
        "workbench.iconTheme"= "material-icon-theme";
        "window.menuBarVisibility" = "toggle";
        "editor.fontFamily" = "FiraCode Nerd Font,FiraCode Nerd Font Ret";
        "editor.fontSize"= 16;
        "editor.wordWrap"= "on";
        "editor.fontLigatures" = true;
        "editor.guides.bracketPairs"= true;
        "editor.guides.bracketPairsHorizontal"= true;
        "material-icon-theme.folders.color"= "#26a69a";
        "editor.language.colorizedBracketPairs"= [
          [
              "["
              "]"
          ]
          [
              "("
              ")"
          ]
          [
              "{"
              "}"
          ]
        ];
        "workbench.colorCustomizations"= {
          "[Monochrome Light Amplified]"= {
              "editorBracketHighlight.foreground1"= "#FCA311";
              "editorBracketHighlight.foreground2"= "#F9901C";
              "editorBracketHighlight.foreground3"= "#F57D26";
              "editorBracketHighlight.foreground4"= "#F7693C";
              "editorBracketHighlight.foreground5"= "#F85552";
              "editorBracketHighlight.foreground6"= "#e14d4b";
          };
          "[Monochrome Dark Amplified]"= {
              "editorBracketHighlight.foreground1"= "#BE6969";
              "editorBracketHighlight.foreground2"= "#D17374";
              "editorBracketHighlight.foreground3"= "#E67E80";
              "editorBracketHighlight.foreground4"= "#DE8C9B";
              "editorBracketHighlight.foreground5"= "#D699B6";
              "editorBracketHighlight.foreground6"= "#DAA2BD";
          };
        };
        
        # Suggestion and completion
        "editor.inlineSuggest.enabled"= true;
        "editor.autoClosingBrackets"= "never";
        "editor.autoClosingQuotes"= "never";
        "[python]"= {
          "editor.formatOnType"= true;
        };
        "omnisharp.enableRoslynAnalyzers"= true;
        "dotnet.inlayHints.enableInlayHintsForParameters"= true;
        "dotnet.inlayHints.enableInlayHintsForLiteralParameters"= true;
        "dotnet.inlayHints.enableInlayHintsForObjectCreationParameters"= true;
        "dotnet.inlayHints.enableInlayHintsForOtherParameters"= true;
        "csharp.inlayHints.enableInlayHintsForTypes"= true;
        "dotnet.completion.showCompletionItemsFromUnimportedNamespaces"= true;

        # Git
        "git.enableSmartCommit" = true;
        "git.confirmSync" = false;
        "git.openRepositoryInParentFolders"= "never";
        "github.copilot.enable"= {
            "markdown"= "true";
        };
        "github.copilot.advanced"= {};

        # Extensions
        "open-in-browser.default"= "firefox";
        "liveSassCompile.settings.showOutputWindowOn"= "None";
        "prettier.useTabs"= true;
        "better-comments.tags"= [
          {
              "tag"= "!";
              "color"= "#FF2D00";
              "strikethrough"= false;
              "underline"= false;
              "backgroundColor"= "transparent";
              "bold"= false;
              "italic"= false;
          }
          {
              "tag"= "?";
              "color"= "#3498DB";
              "strikethrough"= false;
              "underline"= false;
              "backgroundColor"= "transparent";
              "bold"= false;
              "italic"= false;
          }
          {
              "tag"= "//";
              "color"= "#474747";
              "strikethrough"= true;
              "underline"= false;
              "backgroundColor"= "transparent";
              "bold"= false;
              "italic"= false;
          }
          {
              "tag"= "todo";
              "color"= "#FF8C00";
              "strikethrough"= false;
              "underline"= false;
              "backgroundColor"= "transparent";
              "bold"= false;
              "italic"= false;
          }
          {
              "tag"= "*";
              "color"= "#98C379";
              "strikethrough"= false;
              "underline"= false;
              "backgroundColor"= "transparent";
              "bold"= false;
              "italic"= false;
          }
        ];
        "java.jdt.ls.java.home"= "/usr/lib/jvm/default-runtime";
        "java.configuration.runtimes"= [];
        "java.codeAction.sortMembers.avoidVolatileChanges"= false;

        # Code runner
        "code-runner.clearPreviousOutput"= true;
        "code-runner.runInTerminal"= true;
        "code-runner.executorMap"= {
          "javascript"= "node";
          "java"= "cd $dir && javac $fileName && java $fileNameWithoutExt";
          "c"= "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          "zig"= "zig run";
          "cpp"= "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          "objective-c"= "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          "php"= "cd $dir && sh FileTransfer.sh";
          "python"= "python -u";
          "perl"= "perl";
          "perl6"= "perl6";
          "ruby"= "ruby";
          "go"= "go run";
          "lua"= "lua";
          "groovy"= "groovy";
          "powershell"= "powershell -ExecutionPolicy ByPass -File";
          "bat"= "cmd /c";
          "shellscript"= "bash";
          "fsharp"= "fsi";
          "csharp"= "mcs $dir$fileName && mono $dir$fileNameWithoutExt.exe";
          "vbscript"= "cscript //Nologo";
          "typescript"= "ts-node";
          "coffeescript"= "coffee";
          "scala"= "scala";
          "swift"= "swift";
          "julia"= "julia";
          "crystal"= "crystal";
          "ocaml"= "ocaml";
          "r"= "Rscript";
          "applescript"= "osascript";
          "clojure"= "lein exec";
          "haxe"= "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt";
          "rust"= "cd $dir && rustc $fileName && $dir$fileNameWithoutExt";
          "racket"= "racket";
          "scheme"= "csi -script";
          "ahk"= "autohotkey";
          "autoit"= "autoit3";
          "dart"= "dart";
          "pascal"= "cd $dir && fpc $fileName && $dir$fileNameWithoutExt";
          "d"= "cd $dir && dmd $fileName && $dir$fileNameWithoutExt";
          "haskell"= "runghc";
          "nim"= "nim compile --verbosity:0 --hints:off --run";
          "lisp"= "sbcl --script";
          "kit"= "kitc --run";
          "v"= "v run";
          "sass"= "sass --style expanded";
          "scss"= "scss --style expanded";
          "less"= "cd $dir && lessc $fileName $fileNameWithoutExt.css";
          "FortranFreeForm"= "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          "fortran-modern"= "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          "fortran_fixed-form"= "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          "fortran"= "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          "sml"= "cd $dir && sml $fileName";
          "sql"= "cd $dir && sh FileTransfer.sh";
        };
      };
    };
  };
}
