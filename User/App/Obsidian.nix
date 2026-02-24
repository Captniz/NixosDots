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
/*   imports = [
    ../Themes/${userSettings.theme}/Obsidian-override.nix
  ]; */

  programs.obsidian = {

    enable = true;
    defaultSettings = {
      themes = [
        "Minimal"
        "Typewriter"
      ];

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
        "editor:open-search-replace" = [
          {
            "modifiers" = [
              "Alt"
              "Mod"
            ];
            "key" = "F";
          }
        ];
      };

      communityPlugins = [
        "table-editor-obsidian"
        "code-block-copy"
        "cm-editor-syntax-highlight-obsidian"
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
        "obsidian-style-settings"
        "extended-markdown-syntax"
        "pdf-plus"
        "obsidian-custom-frames"
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
      ];

      extraFiles = {
        "Spaced Gruvbox" = {
          "type" = "theme";
          "path" = "/etc/nixos/User/Themes/Gruvbox-Light/Colors.nix";
        };
      };

      cssSnippets = [
        "ciaus"
      ];
/* 
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
 */
    };
  };
}
