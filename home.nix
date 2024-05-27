{ config, pkgs, ... }:

{
  imports = [ 
    ./User/Settings/Style.nix
    ./User/App/Hyprland.nix
    ./User/App/Dunst.nix
  ];

  # Home config
  home.username = "simo";
  home.homeDirectory = "/home/simo";
  
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  home.packages = with pkgs;  [
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

  gtk.enable = true;
  
  programs = {
    home-manager= {
      enable = true;
    };

    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      font = "FiraCode Nerd Font 12";
      theme = "/etc/nixos/extConfigs/rofi/gruvbox-material.rasi";
      extraConfig = {
        "display-ssh"=    "";
        "display-run"=    "";
        "display-drun"=   "";
        "display-window"= "";
        "display-combi"=  "";
        "show-icons"=     true;
      };
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_material_dark";
        theme_background = false;
      };
    } ;

    starship = {
      enable = true;
      settings = {
        format = "
[┌](orange)[\\[](green) $all[\\]](green)
[└─>](bold orange)$character$battery";

        palette  = "custom";
        palettes.custom = {
          red =     "#cc241d";
          orange =  "#d65d0e";
          yellow =  "#d79921";
          green =   "#98971a";
          cyan =    "#689d6a";
          blue =    "#458588";
          purple =  "#b16286";
          black =   "#282828";
          white =   "#ebdbb2";
        };

        battery = {
          disabled = false;
        };

        line_break = {
          disabled = true;
        };
        add_newline = false;
      };
    };

    eww = {
      enable = true;
      configDir = "/etc/nixos/extConfigs/eww";
    };

    alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 4;
            y = 0;
          };
        };
        colors = {
          primary = {
            background =   "#282828";
            foreground =   "#ebdbb2";
          };
          cursor = {
            cursor =   "#ebdbb2";
            text =   "#ebdbb2";
          };
          normal = {
            red =     "#cc241d";
            yellow =  "#d79921";
            green =   "#98971a";
            cyan =    "#689d6a";
            blue =    "#458588";
            magenta = "#b16286";
            black =   "#282828";
            white =   "#ebdbb2";
          };
          bright = {
            red =     "#fb4934";
            yellow =  "#fabd2f";
            green =   "#b8bb26";
            cyan =    "#8ec07c";
            blue =    "#83a598";
            magenta = "#d3869b";
            black =   "#504945";
            white =   "#fbf1c7";
          };
        };
        font = {
          normal = {
            family = "FiraCode Nerd Font";
            style = "Retina";
          };
          bold = {
            family = "FiraCode Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "FiraCode Nerd Font";
            style = "Italic";
          };
          size = 12;
        };
      };
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
        http.postBuffer = 524288000;
      };
    };
    
    zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        clr = "clear";
        rcat = "cat";
        psqlogin = "sudo -u postgres psql";
        cat = "bat";
        gacp = "git add * ; git commit --all -m '.' ; git push --all";
        flakeup = "nix flake update /etc/nixos";
        homeup = "home-manager switch --flake /etc/nixos --impure";
        nixup = "sudo nixos-rebuild switch";
        nixconfigure = "code /etc/nixos";
        nixdeleteolder = "sudo nix-collect-garbage --delete-older-than";
        zip = "7z a -r -tzip";
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "z"
          "starship"
        ];
      };
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
        "workbench.colorTheme"= "Gruvbox Dark Medium";
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
        "github.copilot.editor.enableAutoCompletions"= true;

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
        "java.home"= "/run/current-system/sw/lib/openjdk";
        "java.jdt.ls.java.home" = "/run/current-system/sw/lib/openjdk";
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
