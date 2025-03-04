{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;

  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "main";
    hash = "sha256-Vvq7uau+UNcriuLE7YMK5rSOXvVaD0ElT59q+09WwdQ=";
  };
in
{
  imports = [
    ../Themes/${userSettings.theme}/Yazi-override.nix
  ];

  programs.yazi = {

    enable = true;

    enableZshIntegration = true;

    initLua = ''
      require("full-border"):setup {
            	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
            	type = ui.Border.ROUNDED,
      }
    '';

    plugins = {

      full-border = "${yazi-plugins}/full-border.yazi";

      git = "${yazi-plugins}/git.yazi";

      smart-filter = "${yazi-plugins}/smart-filter.yazi";

      glow = pkgs.fetchFromGitHub {
        owner = "Reledia";
        repo = "glow.yazi";
        rev = "main";
        hash = "sha256-DPud1Mfagl2z490f5L69ZPnZmVCa0ROXtFeDbEegBBU=";
      };

      hexyl = pkgs.fetchFromGitHub {
        owner = "Reledia";
        repo = "hexyl.yazi";
        rev = "main";
        hash = "sha256-Xv1rfrwMNNDTgAuFLzpVrxytA2yX/CCexFt5QngaYDg=";
      };

      compress = pkgs.fetchFromGitHub {
        owner = "KKV9";
        repo = "compress.yazi";
        rev = "main";
        hash = "sha256-Yf5R3H8t6cJBMan8FSpK3BDSG5UnGlypKSMOi0ZFqzE=";
      };
    };

    keymap = {
      manager = {
        prepend_keymap = [
          {
            on = [
              "A"
              "a"
            ];
            run = "plugin compress";
            desc = "Archive selected files";
          }
        ];
        append_keymap = [
          {
            on = [
              "g"
              "r"
            ];
            run = "cd ~/Documents/Repos";
            desc = "Goto repos";
          }
          {
            on = [
              "g"
              "t"
            ];
            run = "cd ~/Documents";
            desc = "Goto documents";
          }
          {
            on = [
              "g"
              "n"
            ];
            run = "cd /etc/nixos";
            desc = "Goto nix-config";
          }
        ];
      };
    };

    settings = {
      manager = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = false;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
        scrolloff = 5;
        mouse_events = [
          "click"
          "scroll"
        ];
        title_format = "Yazi: {cwd}";
      };

      preview = {
        wrap = "no";
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        image_delay = 30;
        image_filter = "triangle";
        image_quality = 75;
        sixel_fraction = 15;
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      opener = {
        edit = [
          {
            run = "\$\{EDITOR:-vi\} \"$@\"";
            desc = "Edit";
            block = true;
            for = "unix";
          }
        ];
        compress = [
          {
            run = "zip -r \"$@.zip\" \"$@\"";
            desc = "Compress here";
            for = "unix";
          }
          {
            run = "zip -r \"$@.zip\" \"$@\"";
            desc = "Compress here";
            for = "linux";
          }
        ];
        reveal = [
          {
            run = "alacritty --working-directory \"$(dirname \"$1\")\"";
            desc = "Reveal";
            for = "linux";
          }
        ];
        xdg-open = [
          {
            run = "xdg-open \"$1\"";
            desc = "Open with default XDG";
            for = "linux";
          }
        ];
        open-pdf = [
          {
            run = "zathura \"$1\"";
            desc = "Open";
            for = "linux";
          }
        ];
        extract = [
          {
            run = "ya pub extract --list \"$@\"";
            desc = "Extract here";
            for = "unix";
          }
          {
            run = "ya pub extract --list %*";
            desc = "Extract here";
            for = "windows";
          }
        ];
        play = [
          {
            run = "mpv --force-window \"$@\"";
            orphan = true;
            for = "unix";
          }
          {
            run = "mediainfo \"$1\"; echo \"Press enter to exit\"; read _";
            block = true;
            desc = "Show media info";
            for = "unix";
          }
        ];
        code = [
          {
            run = "code \"$1\"";
            desc = "Code";
            for = "linux";
          }
        ];
      };

      open = {
        rules = [
          # Folder
          {
            name = "*/";
            use = [
              "edit"
              "reveal"
              "compress"
              "xdg-open"
            ];
          }
          # Programming Language
          {
            mime = "text/{c,c++,c-header,c++-header,csharp,go,java,javascript,lua,markdown,objective-c,python,ruby,shellscript,sql,yaml}";
            use = [
              "code"
              "edit"
              "reveal"
              "xdg-open"
            ];
          }
          # Text
          {
            mime = "text/*";
            use = [
              "edit"
              "reveal"
              "xdg-open"
            ];
          }
          # Image
          {
            mime = "image/*";
            use = [
              "xdg-open"
              "reveal"
            ];
          }
          # Media
          {
            mime = "{audio,video}/*";
            use = [
              "play"
              "reveal"
            ];
          }
          # PDF - Ebook
          {
            mime = "application/{pdf,epub+zip}";
            use = [
              "open-pdf"
              "xdg-open"
              "reveal"
            ];
          }
          # Archive
          {
            mime = "application/{,g}zip";
            use = [
              "extract"
              "reveal"
            ];
          }
          {
            mime = "application/{tar,bzip*,7z-compressed,xz,rar}";
            use = [
              "extract"
              "reveal"
            ];
          }
          # JSON
          {
            mime = "application/{json,x-ndjson}";
            use = [
              "edit"
              "reveal"
            ];
          }
          # Empty file
          {
            mime = "inode/empty";
            use = [
              "edit"
              "reveal"
            ];
          }
          # Fallback
          {
            name = "*";
            use = [
              "open"
              "reveal"
            ];
          }
        ];
      };

      tasks = {
        micro_workers = 10;
        macro_workers = 25;
        bizarre_retry = 5;
        image_alloc = 536870912; # 512MB
        image_bound = [
          0
          0
        ];
        suppress_preload = false;
      };

      plugin = {
        prepend_previewers = [
          {
            name = "*.md";
            run = "glow";
          }
        ];

        fetchers = [
          # Mimetype
          {
            id = "mime";
            name = "*";
            run = "mime";
            "if" = "!mime";
            prio = "high";
          }
        ];

        preloaders = [
          # Image
          {
            mime = "image/{avif,hei?,jxl,svg+xml}";
            run = "magick";
          }
          {
            mime = "image/*";
            run = "image";
          }
          # Video
          {
            mime = "video/*";
            run = "video";
          }
          # PDF
          {
            mime = "application/pdf";
            run = "pdf";
          }
          # Font
          {
            mime = "font/*";
            run = "font";
          }
          {
            mime = "application/vnd.ms-opentype";
            run = "font";
          }
        ];

        previewers = [
          {
            name = "*/";
            run = "folder";
            sync = true;
          }
          # Code
          {
            mime = "text/*";
            run = "code";
          }
          {
            mime = "*/{xml,javascript,x-wine-extension-ini}";
            run = "code";
          }
          # JSON
          {
            mime = "application/{json,x-ndjson}";
            run = "json";
          }
          # Image
          {
            mime = "image/{avif,hei?,jxl,svg+xml}";
            run = "magick";
          }
          {
            mime = "image/*";
            run = "image";
          }
          # Video
          {
            mime = "video/*";
            run = "video";
          }
          # PDF
          {
            mime = "application/pdf";
            run = "pdf";
          }
          # Archive
          {
            mime = "application/{,g}zip";
            run = "archive";
          }
          {
            mime = "application/x-{tar,bzip*,7z-compressed,xz,rar,iso9660-image}";
            run = "archive";
          }
          # Font
          {
            mime = "font/*";
            run = "font";
          }
          {
            mime = "application/vnd.ms-opentype";
            run = "font";
          }
          # Empty file
          {
            mime = "inode/x-empty";
            run = "empty";
          }
          # Fallback
          {
            name = "*";
            run = "file";
          }
        ];
      };

      input = {
        cursor_blink = false;

        # cd
        cd_title = "Change directory:";
        cd_origin = "top-center";
        cd_offset = [
          0
          2
          50
          3
        ];

        # create
        create_title = [
          "Create:"
          "Create Directory:"
        ];
        create_origin = "top-center";
        create_offset = [
          0
          2
          50
          3
        ];

        # rename
        rename_title = "Rename:";
        rename_origin = "hovered";
        rename_offset = [
          0
          1
          50
          3
        ];

        # filter
        filter_title = "Filter:";
        filter_origin = "top-center";
        filter_offset = [
          0
          2
          50
          3
        ];

        # find
        find_title = [
          "Find next:"
          "Find previous:"
        ];
        find_origin = "top-center";
        find_offset = [
          0
          2
          50
          3
        ];

        # search
        search_title = "Search via {n}:";
        search_origin = "top-center";
        search_offset = [
          0
          2
          50
          3
        ];

        # shell
        shell_title = [
          "Shell:"
          "Shell (block):"
        ];
        shell_origin = "top-center";
        shell_offset = [
          0
          2
          50
          3
        ];

      };

      confirm = {
        # trash
        trash_title = "Trash {n} selected file{s}?";
        trash_origin = "center";
        trash_offset = [
          0
          0
          70
          20
        ];

        # delete
        delete_title = "Permanently delete {n} selected file{s}?";
        delete_origin = "center";
        delete_offset = [
          0
          0
          70
          20
        ];

        # overwrite
        overwrite_title = "Overwrite file?";
        overwrite_content = "Will overwrite the following file:";
        overwrite_origin = "center";
        overwrite_offset = [
          0
          0
          50
          15
        ];

        # quit
        quit_title = "Quit?";
        quit_content = "The following task is still running, are you sure you want to quit?";
        quit_origin = "center";
        quit_offset = [
          0
          0
          50
          15
        ];

      };

      pick = {
        open_title = "Open with:";
        open_origin = "hovered";
        open_offset = [
          0
          1
          50
          7
        ];
      };

      which = {
        sort_by = "none";
        sort_sensitive = false;
        sort_reverse = false;
        sort_translit = false;
      };

      log = {
        enabled = false;
      };
    };
  };
}
