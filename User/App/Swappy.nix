{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:
{
  programs.swappy = {
    enable = true;
    settings = {
      Default = {
        auto_save = false;
        early_exit = false;
        fill_shape = false;
        line_size = 5;
        paint_mode = "brush";
        save_dir = "${config.home.homeDirectory}/Images/Screenshots5";
        save_filename_format = "screenshot-%Y%m%d-%H%M%S.png";
        show_panel = false;
        text_font = "sans-serif";
        text_size = 20;
        transparency = 50;
        transparent = false;
      };
    };
  };
}
