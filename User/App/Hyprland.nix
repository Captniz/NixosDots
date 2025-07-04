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
    ../Themes/${userSettings.theme}/Hyprland-override.nix
  ];

  # Programs & configs
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      # Vars
      "$mod" = "SUPER";
      "$wallpaper" = "~/Images/gruvbox-wallpapers/wallpapers/anime/108948084_p0.png";
      "$activeBorder" = "rgba(8DA101dd)";
      "$inactiveBorder" = "rgba(c5c9aaff)";
      "$shadow" = "rgba(1a1a1aee)";

      monitor = [
        "eDP-1,preferred,0x0,1"
        "DP-1,preferred,1920x0,1"
        "DP-2,preferred,1920x0,1"
        "HDMI-A-1,preferred,1920x0,1"
        " ,preferred,1920x0,1"
      ];

      workspace = [
        "1, monitor:DP-2, default:true"
        "2, monitor:DP-2, default:true"
        "3, monitor:DP-2, default:true"
        "4, monitor:DP-2, default:true"
        "5, monitor:DP-2, default:true"
        "6, monitor:DP-2, default:true"
        "7, monitor:DP-2, default:true"
        "8, monitor:DP-2, default:true"
        "9, monitor:DP-2, default:true"
        "10, monitor:DP-2, default:true"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        no_border_on_floating = true;
        layout = "dwindle";
        #cursor_inactive_timeout = 3;
        "col.active_border" = "$activeBorder";
        "col.inactive_border" = "$inactiveBorder";
      };

      cursor = {
        inactive_timeout = 3;
        #no_hardware_cursors = true; # Causes smearing
        hide_on_touch = true;
      };

      misc = {
        new_window_takes_over_fullscreen = 2;
        disable_hyprland_logo = true;
      };

      gestures = {
        workspace_swipe = true;
      };

      input = {
        kb_layout = userSettings.keyboard;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = "yes";
          middle_button_emulation = true;
        };
      };

      decoration = {
        active_opacity = 0.85;
        inactive_opacity = 0.85;
        rounding = 5;
        #drop_shadow = true;
        #shadow_range = 5;
        #shadow_render_power = 3;
        blur = {
          enabled = true;
          size = 9;
          new_optimizations = true;
          passes = 3;
          ignore_opacity = true;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      bind = [
        # Lauchers
        "$mod, RETURN, exec, alacritty"
        "$mod, R, exec, [float; center] rofi -show drun"
        "$mod, F, exec, firefox"
        "$mod, A, exec, code"
        "$mod, Q, exec, obsidian"
        "$mod, S, exec, grim -g \"$(slurp)\""
        "$mod, E, exec, alacritty -e yazi"
        "$mod, W, exec, alacritty -e btop"
        "$mod, code:60, exec, rofi -show emoji"
        "$mod, N, exec, rofi -show calc"
        "$mod, L, exec, hyprlock"

        # Window managment
        "$mod, J, togglesplit,"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, C, killactive,"
        "$mod, V, togglefloating,"
        "$mod, P, pin,activewindow"
        "$mod, SPACE, fullscreen"
        "$mod, M, exit,"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      binde = [
        # System settings controls
        "$mod, F2, exec, wpctl set-volume @DEFAULT_SINK@ 0.05- && sh /etc/nixos/User/Scripts/NotifyVolume.sh"
        "$mod, F3, exec, wpctl set-volume @DEFAULT_SINK@ 0.05+ && sh /etc/nixos/User/Scripts/NotifyVolume.sh"
        "$mod, F5, exec, light -U 5 && sh /etc/nixos/User/Scripts/NotifyBrightness.sh"
        "$mod, F6, exec, light -A 5 && sh /etc/nixos/User/Scripts/NotifyBrightness.sh"
      ];

      bindm = [
        # Move/resize windows
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        " , switch:on:Lid Switch, exec, dunstify -u critical 'Lid Closed' 'The lid has been closed'"
        " , switch:off:Lid Switch, exec, dunstify -u low 'Lid Opened' 'The lid has been opened'"
      ];

      windowrulev2 = [
        "opaque,class:^(firefox)$"
        "opaque,class:^(mirage)$"
        "float,class:^(Eww)$"
        "noanim,class:^(ueberzugpp_[A-Za-z0-9]+)$"
        "stayfocused,class:^(Rofi)$"
      ];

      exec-once = [
        "swww-daemon && swww img $wallpaper"
        "eww open bar"
        "polkit-agent-helper-1"
        "systemctl start --user polkit-gnome-authentication-agent-1"
        "systemctl start --user pipewire.service"
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.00 && sh /etc/nixos/User/Scripts/NotifyVolume.sh"
        "copyq --start-server"
        "wl-clip-persist --clipboard regular"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "sleep 2 && systemctl restart --user pipewire.service"
        "hyprctl dispatch workspace 1"
        "sh /etc/nixos/User/Scripts/MonitorSwitcher.sh"
      ];
    };
  };
}
