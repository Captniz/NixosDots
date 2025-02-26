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
  programs.hyprlock = {
    enable = true;
    settings = {
      #Theme base from MrVivekRajan
      #https://github.com/MrVivekRajan/Hypr-Dots

      background = {
        path = "~/Images/Wallpapers/115.png";
        blur_passes = 3;
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

      label = {
        text = "cmd[update:1000] echo \"$(date +\"%-I:%M%p\")\"";
        color = colors.yellow;
        font_size = 120;
        #font_family = "SF Pro Display Bold";
        position = "0, -140";
        halign = center;
        valign = top;
      };

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
        #font_family = SF Pro Display Bold
        placeholder_text = "<i><span foreground=\"##ffffff99\">Use Me</span></i>";
        foreground = "\"##ffffff99\">Use Me</span></i>";
        hide_input = false;
        position = "0, -140";
        halign = center;
        valign = center;
      };

    };
  };
}
