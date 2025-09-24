{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
in
{
  imports = [
    ../Themes/${userSettings.theme}/Zsh-override.nix
  ];
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    enableBashIntegration = true;

    settings = {
      format = "[╭─](gray)[](bg:red fg:black)$os$username[](bg:orange fg:red)$directory[](fg:orange bg:yellow)$git_branch$git_status$docker_context[](fg:yellow bg:green)$all[](fg:green bg:cyan)$battery[](fg:cyan bg:blue)$time[ ](fg:blue)$line_break$character
";
      right_format = "$status";

      palette = "custom";
      palettes.custom = {
        dim_red = colors.faded_red;
        red = colors.red;
        orange = colors.orange;
        yellow = colors.yellow;
        green = colors.green;
        cyan = colors.aqua;
        blue = colors.blue;
        purple = colors.purple;
        black = colors.black;
        gray = colors.gray;
        white = colors.white;
      };

      username = {
        show_always = true;
        style_user = "bold bg:red";
        style_root = "bold bg:red";
        format = "[ $user ]($style)";
        disabled = false;
      };

      directory = {
        style = "bold bg:orange";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Images" = " ";
      };

      git_branch = {
        symbol = "";
        style = "bold bg:yellow";
        format = "[ $symbol $branch]($style)";
      };

      git_status = {
        style = "bold bg:yellow";
        format = "[$all_status$ahead_behind ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bold bg:blue";
        format = "[  $time ]($style)";
      };

      battery = {
        disabled = false;
        format = "[ $symbol$percentage ]($style)";
      };

      battery.display = [
        {
          threshold = 100;
          style = "bold bg:cyan fg:white";
        }
      ];

      character = {
        format = "$symbol ";
        success_symbol = "[╰─ ](gray)[](red)[](yellow)[](green)";
        error_symbol = "[╰─ ](gray)[](red)[](red)[](red)";
      };

      cmd_duration = {
        format = "[ took ]($style)[$duration ](bold $style)";
        style = "bg:green fg:white";
      };

      rust = {
        format = "[ via ]($style)[$symbol]($style)[$version ](bold $style)";
        style = "bg:green fg:white";
      };

      package = {
        format = "[ is ]($style)[$symbol$version ](bold $style)";
        style = "bg:green fg:white";
      };

      status = {
        style = "white";
        success_symbol = "[✔](green) ";
        symbol = "[❌](red) ";
        map_symbol = true;
        disabled = false;
      };

      add_newline = true;
    };
  };

  programs.zsh = {
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
      flakeup = "nix flake update --flake /etc/nixos";
      homeup = "home-manager switch --flake /etc/nixos --impure";
      nixup = "nix-store --add-fixed sha256 /etc/nixos/User/ExtraConfigs/cider/cider-linux-x64.AppImage;sudo nixos-rebuild switch --flake /etc/nixos";
      nixconfigure = "code /etc/nixos";
      nixdeleteolder = "home-manager expire-generations '-14days';sudo nix-collect-garbage -d --delete-older-than";
      zip = "7z a -r -tzip";
      ocr = "/etc/nixos/User/Scripts/OcrTextExtractor.sh";
      search = "yazi $(fzf)";
      searchall = "cd /;yazi $(fzf)";
      cd = "z";
      
      #! Hasn't been necessary recently 
      # fixaudio = "systemctl restart --user pipewire.service";
      systemupdate = "cd /etc/nixos;cp flake.lock bu-flake.lock;flakeup;git add *;git commit --all -m '!Breaking changes! System updated';git push;homeup;nixup";
      unmount = "sudo umount -f /mnt/ExtDrive";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "starship"
        "zoxide"
      ];
    };
  };
}
