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
    ../Themes/${userSettings.theme}/Dunst-override.nix
  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        # Color
        frame_color = colors.bg3;
        separator_color = "frame";
        transparency = 10;

        # Text
        word_wrap = true;
        markup = "full";
        progress_bar = true;

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
        layer = "overlay";
        #force_xwayland = true;

        # Icons
        icon_path = "${pkgs.papirus-icon-theme}/share/icons/breeze-dark/status/16";
      };

      urgency_low = {
        background = colors.bg0;
        foreground = colors.bright_blue;
        frame_color = colors.bright_blue;
        timeout = 10;
      };

      urgency_normal = {
        background = colors.bg0;
        foreground = colors.bright_green;
        frame_color = colors.bright_green;
        timeout = 15;
      };

      urgency_critical = {
        background = colors.bg0;
        foreground = colors.bright_red;
        frame_color = colors.bright_red;
        timeout = 0;
      };
    };
  };
}
