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
  programs.hyprlock.settings = {
    background = lib.mkForce {
      path = "~/Images/Wallpapers/115.png";
      blur_passes = 2;
      contrast = 0.8916;
      brightness = 0.8172;
      vibrancy = 0.1696;
      vibrancy_darkness = 0.0;
    };
  };

  label = lib.mkForce [
    # TIME
    {
      text = "cmd[update:1000] echo \"$(date +\"%-I:%M%p\")\"";
      color = "rgba(${lib.strings.removePrefix "#" colors.yellow}dd)";
      font_size = 120;
      font_family = "Iosevka NFM Bold";
      position = "0, -140";
      halign = "center";
      valign = "top";
    }

    # DAY-DATE-MONTH
    {
      text = "cmd[update:1000] echo \"<span>$(date '+%A, %d %B')</span>\"";
      color = "rgba(225, 225, 225, 0.75)";
      font_size = 30;
      font_family = "Iosevka NFM Bold";
      position = "0, 200";
      halign = "center";
      valign = "center";
    }

    # LOGO
    {
      text = "<span> </span>";
      color = "rgba(255, 255, 255, 0.65)";
      font_size = 120;
      position = "0, -60";
      halign = "center";
      valign = "center";
    }

    # USER
    {
      text = "Spacca tutto $USER";
      color = "rgba(255, 255, 255, .65)";
      font_size = 25;
      font_family = "Iosevka NFM Bold";
      position = "0, -270";
      halign = "center";
      valign = "center";
    }
  ];
}
