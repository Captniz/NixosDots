{ config, lib, pkgs, ...}:

{
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
}