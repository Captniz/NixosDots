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
      # General
      clr = "clear";
      psqlogin = "sudo -u postgres psql";
      cat = "bat";
      gacp = "git add * ; git commit --all -m '.' ; git push --all";
      zip = "7z a -r -tzip";
      search = "yazi $(fzf)";
      searchall = "cd /;yazi $(fzf)";
      cd = "z";
      ocr = "/etc/nixos/User/Scripts/OcrTextExtractor.sh";
      unmount = "sudo umount -f /mnt/ExtDrive";
      hybernate = "systemctl hibernate";
      hybrid-sleep = "systemctl hybrid-sleep";

      # Nixos
      update-showlog = "cat /var/log/nixos-update.log | less";
      gc-showlog = "cat /var/log/nixos-gc.log | less";
      home-listgen = "home-manager generations";
      user-listgen = "nix-env --list-generations";
      system-listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      system-gc = "/etc/nixos/User/Scripts/GarbageCollector.sh";
      system-update = "/etc/nixos/User/Scripts/SystemUpdate.sh";
      flakeup = "nix flake update --flake /etc/nixos";
      homeup = "home-manager switch --flake /etc/nixos --impure";
      nixup = "sudo nixos-rebuild switch --flake /etc/nixos";
      nixconfigure = "code /etc/nixos";
      optimise-store = "sudo nix-store --optimise";

      #! Hasn't been necessary recently
      # fixaudio = "systemctl restart --user pipewire.service";
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
