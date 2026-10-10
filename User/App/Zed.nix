{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:

{
  programs.zed-editor = {
    enable = true;
    defaultEditor = true;
    # Zed settings
    #
    # For information on how to configure Zed, see the Zed
    # documentation: https://zed.dev/docs/configuring-zed
    #
    # To see all of Zed's default settings without changing your
    # custom settings, run `zed: open default settings` from the
    # command palette (cmd-shift-p / ctrl-shift-p)
    mutableUserSettings = false;
    mutableUserKeymaps = false;
    extensions = [
      "colored-zed-icons-theme"
      "dockerfile"
      "git-firefly"
      "gruvbox-material-mix"
      "html"
      "java"
      "latex"
      "lua"
      "xml"
      "make"
      "sql"
      "toml"
      "nix"
      "rust-snippets"
    ];
    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          # "shift shift" = "file_finder::Toggle";
        };
      }
      {
        context = "Editor && vim_mode == insert";
        bindings = {
          # "j k" = "vim::NormalBefore";
        };
      }
      {
        context = "Workspace";
        bindings = {
          f2 = "file_finder::Toggle";
        };
      }
      {
        context = "Workspace";
        unbind = {
          ctrl-e = "file_finder::Toggle";
        };
      }
      {
        context = "Workspace";
        bindings = {
          f3 = "task::Spawn";
        };
      }
      {
        context = "Workspace";
        unbind = {
          alt-shift-t = "task::Spawn";
        };
      }
      {
        context = "Workspace";
        bindings = {
          f4 = "task::Rerun";
        };
      }
      {
        context = "Workspace";
        unbind = {
          ctrl-alt-r = "task::Rerun";
        };
      }
      {
        context = "ProjectSearchView";
        unbind = {
          ctrl-alt-f = "project_search::OpenTextFinder";
        };
      }
      {
        context = "ProjectSearchBar";
        unbind = {
          ctrl-alt-f = "project_search::OpenTextFinder";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "Pane";
        unbind = {
          shift-find = "project_search::ToggleFocus";
        };
      }
      {
        context = "Pane";
        unbind = {
          ctrl-alt-f = "project_search::ToggleFilters";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "Pane";
        unbind = {
          ctrl-shift-f = "project_search::ToggleFocus";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "TextFinder || TextFinder > Picker > Editor || TextFinder > Picker > menu";
        unbind = {
          ctrl-alt-f = "text_finder::ToProjectSearch";
        };
      }
      {
        context = "Terminal";
        unbind = {
          ctrl-shift-f = "buffer_search::Deploy";
        };
      }
      {
        context = "Workspace";
        unbind = {
          ctrl-shift-f = "pane::DeploySearch";
        };
      }
      {
        context = "ProjectSearchBar";
        unbind = {
          ctrl-shift-f = "search::FocusSearch";
        };
      }
      {
        context = "Editor && mode == full";
        bindings = {
          ctrl-shift-f = "text_finder::Toggle";
        };
      }
      {
        context = "Editor && mode == full";
        unbind = {
          ctrl-alt-f = "text_finder::Toggle";
        };
      }
      {
        bindings = {
          ctrl-b = "project_panel::Toggle";
        };
      }
      {
        context = "Editor";
        unbind = {
          f2 = "editor::Rename";
        };
      }
      {
        context = "ProjectPanel";
        unbind = {
          f2 = "project_panel::Rename";
        };
      }
      {
        context = "AcpThread";
        unbind = {
          f3 = "agent::SelectNextThreadMatch";
        };
      }
      {
        context = "Pane";
        unbind = {
          f3 = "search::SelectNextMatch";
        };
      }
      {
        unbind = {
          f4 = "debugger::Start";
        };
      }
    ];
    userSettings = {
      proxy = "";
      git_panel = {
        show_count_badge = false;
        folder_indicator = "both";
        file_icons = false;
        tree_view = true;
        collapse_untracked_diff = false;
        status_style = "icon";
      };
      outline_panel = {
        git_status = true;
        folder_indicator = "both";
        button = true;
      };
      focus_follows_mouse = {
        enabled = true;
      };
      bottom_dock_layout = "contained";
      tabs = {
        show_diagnostics = "errors";
        file_icons = true;
        git_status = false;
      };
      tab_bar = {
        show_pinned_tabs_in_separate_row = false;
        show_tab_bar_buttons = true;
        show_nav_history_buttons = true;
        show = true;
      };
      title_bar = {
        button_layout = "platform_default";
        show_menus = false;
        show_onboarding_banner = true;
        show_project_items = true;
        show_worktree_name = true;
        show_branch_status_icon = true;
      };
      debugger = {
        button = true;
      };
      status_bar = {
        show_active_file = false;
        line_endings_button = true;
        cursor_position_button = true;
        active_language_button = true;
      };
      project_panel = {
        auto_open = {
          on_drop = false;
          on_paste = false;
          on_create = false;
        };
        hide_root = true;
        git_status_indicator = true;
        diagnostic_badges = true;
        show_diagnostics = "all";
        bold_folder_labels = true;
        git_status = true;
        folder_indicator = "both";
        entry_spacing = "comfortable";
        dock = "left";
        button = true;
      };
      close_on_file_delete = true;
      search = {
        center_on_match = true;
        include_ignored = true;
      };
      use_smartcase_search = true;
      diagnostics = {
        button = true;
        inline = {
          enabled = true;
        };
      };
      document_symbols = "off";
      semantic_tokens = "off";
      lsp_results_location = "multi_buffer";
      middle_click_paste = false;
      lsp_document_colors = "inlay";
      completion_menu_scrollbar = "always";
      relative_line_numbers = "disabled";
      edit_predictions = {
        provider = "copilot";
        allow_data_collection = "no";
        mode = "subtle";
      };
      agent_servers = {
        github-copilot-cli = {
          type = "registry";
        };
      };
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      autoscroll_on_clicks = false;
      base_keymap = "VSCode";
      buffer_font_fallbacks = [
        "FiraCode Nerd Font"
      ];
      buffer_font_family = "FiraMono Nerd Font Mono";
      buffer_font_size = 16.0;
      cli_default_open_behavior = "new_window";
      code_lens = "on";
      colorize_brackets = true;
      completion_menu_item_kind = "symbol";
      completions = {
        words = "fallback";
      };
      default_open_behavior = "new_window";
      format_on_save = "on";
      gutter = {
        runnables = true;
      };
      icon_theme = "Colored Zed Icons Theme Light";
      indent_guides = {
        active_line_width = 3;
        background_coloring = "disabled";
        coloring = "fixed";
        line_width = 1;
      };
      inlay_hints = {
        enabled = true;
        show_background = false;
      };
      lsp = {
        rust-analyzer = {
          binary = {
            path = "/nix/store/1xkz9vjfvj0p4a2s7v9rpkc9jix1fmln-rust-analyzer-2026-08-03/bin/rust-analyzer";
          };
        };
      };
      languages = {
        Rust = {
          language_servers = [ "rust-analyzer" ];
          format_on_save = "on";
          formatter = {
            language_server = {
              name = "rust-analyzer";
              method = "rustfmt";
            };
          };
        };
      };
      markdown_preview_code_font_family = "FiraMono Nerd Font Mono";
      markdown_preview_font_family = "Iosevka Nerd Font";
      minimap = {
        show = "always";
        thumb = "always";
      };
      reveal_if_open = true;
      scroll_beyond_last_line = "vertical_scroll_margin";
      scrollbar = {
        axes = {
          vertical = true;
        };
        show = "auto";
      };
      session = {
        trust_all_worktrees = true;
      };
      show_edit_predictions = true;
      soft_wrap = "editor_width";
      sticky_scroll = {
        enabled = false;
      };
      tab_size = 4;
      telemetry = {
        anthropic_retention = false;
        diagnostics = false;
        metrics = false;
      };
      theme = {
        dark = "Gruvbox Dark Hard";
        light = "Gruvbox Light";
        mode = "system";
      };
      toolbar = {
        breadcrumbs = true;
        code_actions = false;
        quick_actions = true;
        selections_menu = true;
      };
      ui_font_size = 16;
      use_autoclose = false;
      which_key = {
        enabled = true;
      };
    };
  };
}
