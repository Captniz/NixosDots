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
    ../Themes/${userSettings.theme}/Hyprlock-override.nix
  ];

  programs.hyprlock = {
    enable = true;
    settings = {
      #Theme base from MrVivekRajan
      #https://github.com/MrVivekRajan/Hypr-Dots

      background = {
        path = "~/Images/Wallpapers/115.png";
        blur_passes = 2;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

      label = [
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
      input-field = {
        size = "290, 60";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(60, 56, 54, 0.35)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        font_family = "Iosevka NFM Bold";
        placeholder_text = "<i><span foreground=\"##ffffff99\"> -_- </span></i>";
        foreground = "\"##ffffff99\"> -_- </span></i>";
        hide_input = false;
        position = "0, -340";
        halign = "center";
        valign = "center";
      };
    };
  };
}
