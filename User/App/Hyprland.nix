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
        layout = "dwindle";
        "col.active_border" = "$activeBorder";
        "col.inactive_border" = "$inactiveBorder";
      };

      cursor = {
        inactive_timeout = 3;
        hide_on_touch = true;
      };

      misc = {
        disable_hyprland_logo = true;
      };

      gesture = [
        "3, horizontal, workspace"
        "3, down, dispatcher, exec, [float; size 1100 500;animation slide top] alacritty --class Btop -e btop"
        "3, up, close"
        "4, swipe, move"
      ];

      input = {
        kb_layout = userSettings.keyboard;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = "yes";
          middle_button_emulation = true;
          disable_while_typing = false;
        };
      };

      decoration = {
        active_opacity = 0.85;
        inactive_opacity = 0.85;
        rounding = 5;
        blur = {
          enabled = true;
          size = 9;
          new_optimizations = true;
          passes = 3;
          ignore_opacity = true;
          vibrancy = 0.5;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.01";
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      bind = [
        # Lauchers
        "SUPER, RETURN, exec, alacritty --class Term"
        "SUPER, R, exec, [float; center] rofi -show drun"
        "SUPER, F, exec, zen-beta"
        "SUPER, A, exec, code"
        "SUPER, Q, exec, rofi -show obsidian"
        "SUPER, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
        "SUPER, E, exec, alacritty --class Yazi -e yazi "
        "SUPER, B, exec, alacritty --class Btop -e btop"
        "SUPER, code:60, exec, rofi -show emoji"
        "SUPER, N, exec, rofi -show calc"
        "SUPER, L, exec, rofi -show p -modi p:\'/usr/bin/env bash \"${userSettings.scriptsPath}/PowerMenu.sh\"\'"
        "SUPER, I, exec, rofi -show nerdy"
        "SUPER, W, exec, sh ${userSettings.scriptsPath}/NixActions.sh"
        "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        # Window managment
        "SUPER, TAB, exec, sh ${userSettings.scriptsPath}/WindowSwitcher.sh"
        "SUPER, J, togglesplit,"
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER, C, killactive,"
        "SUPER, X, togglefloating,"
        "SUPER, P, pin,activewindow"
        "SUPER, SPACE, fullscreen"
        "SUPER, M, exit,"

        # Workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # Move active window to a workspace
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
      ];

      binde = [
        # System settings controls
        "SUPER, F1, exec, wpctl set-mute @DEFAULT_SINK@ toggle && sh ${userSettings.scriptsPath}/NotifyVolume.sh && qs ipc call volume updateMute"
        "SUPER, F2, exec, wpctl set-volume @DEFAULT_SINK@ 0.05- && sh ${userSettings.scriptsPath}/NotifyVolume.sh && qs ipc call volume update"
        "SUPER, F3, exec, wpctl set-volume @DEFAULT_SINK@ 0.05+ && sh ${userSettings.scriptsPath}/NotifyVolume.sh && qs ipc call volume update"
        "SUPER, F5, exec, light -U 5 && sh ${userSettings.scriptsPath}/NotifyBrightness.sh && qs ipc call brightness update"
        "SUPER, F6, exec, light -A 5 && sh ${userSettings.scriptsPath}/NotifyBrightness.sh && qs ipc call brightness update"
        "SUPER, F7, exec, playerctl play-pause"
        "SUPER, F8, exec, playerctl previous"
        "SUPER, F9, exec, playerctl next"
      ];

      bindm = [
        # Move/resize windows
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      windowrule = [
        "match:float true, border_size 0"
        "match:class ^(zen-beta)$, opaque on"
        "match:class ^(mirage)$, opaque on"
        "match:class ^(ueberzugpp_[A-Za-z0-9]+)$, no_anim on"
        "match:class ^(ueberzugpp_[A-Za-z0-9]+)$, float on"
        "match:class ^(ueberzugpp_[A-Za-z0-9]+)$, no_initial_focus on"
        "match:class ^(ueberzugpp_[A-Za-z0-9]+)$, no_focus on"
        "match:class ^(ueberzug_[A-Za-z0-9]+)$, no_focus on"
        "match:class ^(ueberzug_[A-Za-z0-9]+)$, no_initial_focus on"
        "match:class ^(ueberzug_[A-Za-z0-9]+)$, no_anim on"
        "match:class ^(ueberzug_[A-Za-z0-9]+)$, float on"
      ];

      layerrule = [
        "match:namespace ^(swww-daemon)$, no_anim on"
        "match:namespace ^(quickshell)$, no_anim on"
        "match:namespace ^(selection)$, no_anim on"
      ];

      exec-once = [
        "hyprctl dispatch workspace 1"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP" # Wayland env for systemd services
      ];
    };
  };
}
