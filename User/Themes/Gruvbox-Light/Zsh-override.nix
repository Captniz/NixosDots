{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ./Colors.nix;
in
{
  programs.starship.settings = lib.mkForce {

    format = "[╭─](gray)[](bg:green fg:white)$os$username[](bg:cyan fg:green)$directory[](fg:cyan bg:blue)$git_branch$git_status$docker_context[](fg:blue bg:purple)$all[](fg:purple bg:red)$battery[](fg:red bg:orange)$time[ ](fg:orange)$line_break$character
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
      style_user = "bold bg:green";
      style_root = "bold bg:green";
      format = "[ $user ]($style)";
      disabled = false;
    };

    directory = {
      style = "bold bg:cyan";
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
      style = "bold bg:blue";
      format = "[ $symbol $branch]($style)";
    };

    git_status = {
      style = "bold bg:blue";
      format = "[$all_status$ahead_behind ]($style)";
    };

    time = {
      disabled = false;
      time_format = "%R";
      style = "bold bg:orange";
      format = "[  $time ]($style)";
    };

    battery = {
      disabled = false;
      format = "[ $symbol$percentage ]($style)";
    };

    battery.display = [
      {
        threshold = 100;
        style = "bold bg:red fg:white";
      }
    ];

    character = {
      format = "$symbol ";
      success_symbol = "[╰─ ](gray)[](green)[](cyan)[](purple)";
      error_symbol = "[╰─ ](gray)[](red)[](red)[](red)";
    };

    cmd_duration = {
      format = "[ took ]($style)[$duration ](bold $style)";
      style = "bg:purple fg:black";
    };

    rust = {
      format = "[ via ]($style)[$symbol]($style)[$version ](bold $style)";
      style = "bg:purple fg:white";
    };

    package = {
      format = "[ is ]($style)[$symbol$version ](bold $style)";
      style = "bg:purple fg:white";
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
}
