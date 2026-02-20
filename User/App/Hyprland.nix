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

      bindd = [
        # Lauchers
        "SUPER, RETURN, New Terminal, exec, alacritty --class Term"
        "SUPER, R, Show App Launcher, exec, [float; center] rofi -show drun"
        "SUPER, F, Open Browser,exec, zen-beta"
        "SUPER, A, Open IDE,exec, code"
        "SUPER, Q, Open Obsidian, exec, rofi -show obsidian"
        "SUPER, S, Screenshot, exec, grim -g \"$(slurp)\" - | swappy -f -"
        "SUPER, E, Open File-manager, exec,alacritty --class Yazi -e yazi "
        "SUPER, B, Show System Performance, exec,alacritty --class Btop -e btop"
        "SUPER, code:60, Open Emoji selector, exec,rofi -show emoji"
        "SUPER, N, Open calculator, exec ,rofi -show calc"
        "SUPER, L, Show Power-menu, exec,rofi -show p -modi p:\'/usr/bin/env bash \"${userSettings.scriptsPath}/PowerMenu.sh\"\'"
        "SUPER SHIFT, L, Toggle HyprIdle, exec,sh ${userSettings.scriptsPath}/ToggleHypridle.sh"
        "SUPER, I, Open Icon selector, exec,rofi -show nerdy"
        "SUPER, W, Show System actions menu, exec,sh ${userSettings.scriptsPath}/NixActions.sh"
        "SUPER, V, Show Clipboard history, exec ,cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        # Window managment
        "SUPER, TAB, Show open Windows , exec, sh ${userSettings.scriptsPath}/WindowSwitcher.sh"
        "SUPER, J, Toggle window Tile Splitting,togglesplit,"
        "SUPER, left,Move focus to the left, movefocus, l"
        "SUPER, right,Move focus to the right, movefocus, r"
        "SUPER, up,Move focus upward, movefocus, u"
        "SUPER, down, Move focus downward,movefocus, d"
        "SUPER, C, Close focused window , killactive,"
        "SUPER, X,Toggle floating on focused window, togglefloating,"
        "SUPER, P, Pin focused window,pin,activewindow"
        "SUPER, SPACE,Toggle fulscreen on focused window, fullscreen"
        "SUPER, M, Exit to TTY, exit,"

        # Workspaces
        "SUPER, 1,Move to workspace 1, workspace, 1"
        "SUPER, 2,Move to workspace 2, workspace, 2"
        "SUPER, 3,Move to workspace 3, workspace, 3"
        "SUPER, 4,Move to workspace 4, workspace, 4"
        "SUPER, 5,Move to workspace 5, workspace, 5"
        "SUPER, 6,Move to workspace 6, workspace, 6"
        "SUPER, 7,Move to workspace 7, workspace, 7"
        "SUPER, 8,Move to workspace 8, workspace, 8"
        "SUPER, 9,Move to workspace 9, workspace, 9"
        "SUPER, 0,Move to workspace 10, workspace, 10"

        # Move active window to a workspace
        "SUPER SHIFT, 1,Move focused window to workspace 1, movetoworkspace, 1"
        "SUPER SHIFT, 2,Move focused window to workspace 2, movetoworkspace, 2"
        "SUPER SHIFT, 3,Move focused window to workspace 3, movetoworkspace, 3"
        "SUPER SHIFT, 4,Move focused window to workspace 4, movetoworkspace, 4"
        "SUPER SHIFT, 5,Move focused window to workspace 5, movetoworkspace, 5"
        "SUPER SHIFT, 6,Move focused window to workspace 6, movetoworkspace, 6"
        "SUPER SHIFT, 7,Move focused window to workspace 7, movetoworkspace, 7"
        "SUPER SHIFT, 8,Move focused window to workspace 8, movetoworkspace, 8"
        "SUPER SHIFT, 9,Move focused window to workspace 9, movetoworkspace, 9"
        "SUPER SHIFT, 0,Move focused window to workspace 10, movetoworkspace, 10"
      ];

      bindde = [
        # System settings controls
        "SUPER, F1, Mute playback,exec, wpctl set-mute @DEFAULT_SINK@ toggle && sh ${userSettings.scriptsPath}/NotifyVolume.sh && qs ipc call volume updateMute"
        "SUPER, F2, Volume down,exec, wpctl set-volume @DEFAULT_SINK@ 0.05- && sh ${userSettings.scriptsPath}/NotifyVolume.sh && qs ipc call volume update"
        "SUPER, F3, Volume up,exec, wpctl set-volume @DEFAULT_SINK@ 0.05+ && sh ${userSettings.scriptsPath}/NotifyVolume.sh && qs ipc call volume update"
        "SUPER, F5, Brightness down,exec, light -U 5 && sh ${userSettings.scriptsPath}/NotifyBrightness.sh && qs ipc call brightness update"
        "SUPER, F6, Brightness up,exec, light -A 5 && sh ${userSettings.scriptsPath}/NotifyBrightness.sh && qs ipc call brightness update"
        "SUPER, F7, Audio player Resume/Pause,exec, playerctl play-pause"
        "SUPER, F8, Audio player Previous ,exec, playerctl previous"
        "SUPER, F9, Audio player Next,exec, playerctl next"
      ];

      binddm = [
        # Move/resize windows
        "SUPER, mouse:272, Move window, movewindow"
        "SUPER, mouse:273, Resize window, resizewindow"
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
