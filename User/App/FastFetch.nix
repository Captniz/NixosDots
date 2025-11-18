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
    ../Themes/${userSettings.theme}/Btop-override.nix
  ];
  programs.fastfetch = {
    enable = true;
    settings = {
      "modules" = [
        "break"
        {
          "type" = "custom";
          "format" = "┌──────────────────────────Hardware──────────────────────────┐";
        }
        {
          "type" = "host";
          "key" = "  PC";
          "keyColor" = "green";
        }
        {
          "type" = "cpu";
          "key" = "  ├ ";
          "showPeCoreCount" = true;
          "keyColor" = "green";
        }
        {
          "type" = "gpu";
          "key" = "  ├ ";
          "detectionMethod" = "pci";
          "keyColor" = "green";
        }
        {
          "type" = "display";
          "key" = "  ├󱄄 ";
          "keyColor" = "green";
        }
        {
          "type" = "disk";
          "key" = "  ├󰋊 ";
          "keyColor" = "green";
        }
        {
          "type" = "memory";
          "key" = "  ├ ";
          "keyColor" = "green";
        }
        {
          "type" = "swap";
          "key" = "  └󰓡 ";
          "keyColor" = "green";
        }
        "break"
        {
          "type" = "custom";
          "format" = "┌──────────────────────────Software──────────────────────────┐";
        }
        {
          "type" = "command";
          "key" = "  OS";
          "keyColor" = "blue";
          "text" = "system=$(nixos-version); echo \"NixOS $system\"";
        }
        
        {
          "type" = "command";
          "key" = "  ├󰘬 ";
          "keyColor" = "blue";
          "text" = "branch=$(cd/etc/nixos;git branch --show-current); echo \"$branch\"";
        }
        {
          "type" = "kernel";
          "key" = "  ├ ";
          "keyColor" = "blue";
        }
        {
          "type" = "wm";
          "key" = "  ├ ";
          "keyColor" = "blue";
        }
        {
          "type" = "de";
          "key" = " DE ";
          "keyColor" = "blue";
        }
        {
          "type" = "terminal";
          "key" = "  ├ ";
          "keyColor" = "blue";
        }
        {
          "type" = "packages";
          "key" = "  ├󰏖 ";
          "keyColor" = "blue";
        }
        {
          "type" = "wmtheme";
          "key" = "  ├󰉼 ";
          "keyColor" = "blue";
        }
        {
          "type" = "command";
          "key" = "  ├󰸌 ";
          "keyColor" = "blue";
          "text" =
            "theme=$(omarchy-theme-current); echo -e \"$theme \\e[38m●\\e[37m●\\e[36m●\\e[35m●\\e[34m●\\e[33m●\\e[32m●\\e[31m●\"";
        }
        {
          "type" = "terminalfont";
          "key" = "  └ ";
          "keyColor" = "blue";
        }
        "break"
        {
          "type" = "custom";
          "format" = "┌────────────────────────Uptime / Age────────────────────────┐";
        }
        {
          "type" = "command";
          "key" = "󱦟 OS Age";
          "keyColor" = "magenta";
          "text" =
            "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          "type" = "uptime";
          "key" = "  └󱫐 Uptime";
          "keyColor" = "magenta";
        }
        "break"
      ];
    };
  };

}
