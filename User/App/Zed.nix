{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  programs.zed-editor = {
    enable = true;
    # Zed settings
    #
    # For information on how to configure Zed, see the Zed
    # documentation: https://zed.dev/docs/configuring-zed
    #
    # To see all of Zed's default settings without changing your
    # custom settings, run `zed: open default settings` from the
    # command palette (cmd-shift-p / ctrl-shift-p)
    settings = {
      "code_lens" = "off";
      "inlay_hints" = {
        "show_background" = false;
        "enabled" = true;
      };
      "completion_menu_item_kind" = "symbol";
      "completions" = {
        "words" = "fallback";
      };
      "use_autoclose" = false;
      "indent_guides" = {
        "background_coloring" = "disabled";
        "coloring" = "fixed";
        "active_line_width" = 3;
        "line_width" = 1;
      };
      "toolbar" = {
        "selections_menu" = true;
        "quick_actions" = true;
        "code_actions" = false;
        "breadcrumbs" = true;
      };
      "scrollbar" = {
        "axes" = {
          "vertical" = true;
        };
        "show" = "auto";
      };
      "gutter" = {
        "runnables" = true;
      };
      "sticky_scroll" = {
        "enabled" = false;
      };
      "autoscroll_on_clicks" = false;
      "scroll_beyond_last_line" = "vertical_scroll_margin";
      "which_key" = {
        "enabled" = true;
      };
      "markdown_preview_code_font_family" = "FiraMono Nerd Font Mono";
      "markdown_preview_font_family" = "Iosevka Nerd Font";
      "colorize_brackets" = true;
      "default_open_behavior" = "new_window";
      "reveal_if_open" = true;
      "cli_default_open_behavior" = "new_window";
      "icon_theme" = "Colored Zed Icons Theme Light";
      "telemetry" = {
        "diagnostics" = false;
        "metrics" = false;
        "anthropic_retention" = false;
      };
      "session" = {
        "trust_all_worktrees" = true;
      };
      "minimap" = {
        "thumb" = "always";
        "show" = "always";
      };
      "autosave" = {
        "after_delay" = {
          "milliseconds" = 1000;
        };
      };
      "buffer_font_fallbacks" = [ "FiraCode Nerd Font Ret" ];
      "buffer_font_family" = "FiraMono Nerd Font Mono";
      "show_edit_predictions" = true;
      "format_on_save" = "on";
      "soft_wrap" = "editor_width";
      "tab_size" = 4;
      "agent_servers" = {
        "github-copilot-cli" = {
          "type" = "registry";
        };
      };
      "base_keymap" = "VSCode";
      "ui_font_size" = 16;
      "buffer_font_size" = 16.0;
      "theme" = {
        "mode" = "system";
        "light" = "Gruvbox Light";
        "dark" = "Gruvbox Dark Hard";
      };
      "lsp" = {
        "rust-analyzer" = {
          "binary" = {
            "path" = {pkgs.rust-analyzer.bin};
          };
        };
      };
    };
  };
}
