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
    ../Themes/${userSettings.theme}/Obsidian-override.nix
  ];

  programs.obsidian = {
    vaults = {
      "cap_files" = {
        target = "${config.home.homeDirectory}/Downloads/cap_files";
      };
    };

    enable = true;
    defaultSettings = {
      app = {
        "cssTheme" = "Spaced Gruvbox";
        "showLineNumber" = true;
        "alwaysUpdateLinks" = true;
        "showUnsupportedFiles" = false;
        "attachmentFolderPath" = "EMBED";
        "spellcheckLanguages" = null;
        "spellcheck" = true;
        "pdfExportSettings" = {
          "includeName" = true;
          "pageSize" = "Tabloid";
          "landscape" = false;
          "margin" = "2";
          "downscalePercent" = 100;
        };
        "showInlineTitle" = true;
      };

      appearance = {
        "accentColor" = "#8da101";
        "cssTheme" = "Spaced Gruvbox";
        "theme" = "obsidian";
        "monospaceFontFamily" = "FiraCode Nerd Font Mono";
        "textFontFamily" = "Inter;FiraCode Nerd Font";
        "enabledCssSnippets" = [
          "ChangeTag"
          "CenterImg"
        ];
        "baseFontSize" = 17;
        "showRibbon" = true;
      };
      /*
            communityPlugins = [
              "table-editor-obsidian"
              "calendar"
              "code-block-copy"
              "cm-editor-syntax-highlight-obsidian"
              "obsidian-excalidraw-plugin"
              "highlightr-plugin"
              "obsidian-icon-folder"
              "obsidian-kanban"
              "obsidian-linter"
              "omnisearch"
              "obsidian-outliner"
              "oz-image-plugin"
              "obsidian-pandoc"
              "tag-wrangler"
              "obsidian-git"
              "text-extractor"
              "dynamic-outline"
              "obsidian-list-callouts"
              "obsidian-style-settings"
              "extended-markdown-syntax"
              "pdf-plus"
            ];

            corePlugins = [
              "file-explorer"
              "global-search"
              "switcher"
              "graph"
              "backlink"
              "canvas"
              "outgoing-link"
              "tag-pane"
              "page-preview"
              "templates"
              "note-composer"
              "command-palette"
              "slash-command"
              "editor-status"
              "outline"
              "word-count"
              "file-recovery"
              "bookmarks"
              "properties"
              #"bases"
            ];
      */
      cssSnippets = [
        "/etc/nixos/User/ExtraConfigs/obsidian/ChangeTag.css"
        "/etc/nixos/User/ExtraConfigs/obsidian/CenterImg.css"
      ];
      /*
            hotkeys = {
              "command-palette:open" = [
                {
                  "modifiers" = [ ];
                  "key" = "F1";
                }
              ];
              "app:open-help" = [ ];
              "outline:open" = [
                {
                  "modifiers" = [
                    "Mod"
                  ];
                  "key" = "=";
                }
              ];
              "highlightr-plugin:highlighter-plugin-menu" = [
                {
                  "modifiers" = [
                    "Mod"
                  ];
                  "key" = "H";
                }
              ];
              "editor=open-search-replace" = [
                {
                  "modifiers" = [
                    "Alt"
                    "Mod"
                  ];
                  "key" = "F";
                }
              ];
            };
      */
      themes = [
        "/etc/nixos/User/ExtraConfigs/obsidian/Spaced Gruvbox"
      ];
    };
  };
}
