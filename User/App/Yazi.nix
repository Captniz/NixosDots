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
    hash = "sha256-7vsqHvdNimH/YVWegfAo7DfJ+InDr3a1aNU0f+gjcdw=";
  };
in
{
  imports = [
    ../Themes/${userSettings.theme}/Yazi-override.nix
  ];

  # Fixes xdg-open for yazi and related errors
  xdg.desktopEntries.yazi = {
    name = "Yazi";
    exec = "alacritty -e yazi %u"; # or alacritty -e yazi %u
    icon = "yazi";
    type = "Application";
    comment = "Blazing fast terminal file manager written in Rust";
    genericName = "File Manager";
    terminal = false;
    categories = [
      "Utility"
      "System"
      "FileManager"
      "Core"
      "FileTools"
      "ConsoleOnly"
    ];
    settings = {
      Keywords = "File;Manager;Explorer;Browser;Launcher";
    };
    mimeType = [ "inode/directory" ];
  };

  programs.yazi = {

    enable = true;
    shellWrapperName = "y";
    enableZshIntegration = true;

    extraPackages = with pkgs; [
      glow
      ouch
      ueberzug
      imagemagick
      wl-clipboard
    ];

    initLua = ''

      require("full-border"):setup {
            	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
            	type = ui.Border.ROUNDED,

      }

      require("git"):setup()
    '';

    plugins = {
      git = pkgs.yaziPlugins.git;
      glow = pkgs.yaziPlugins.glow;
      mount = pkgs.yaziPlugins.mount;
      full-border = pkgs.yaziPlugins.full-border;
      smart-filter = pkgs.yaziPlugins.smart-filter;
      compress = pkgs.yaziPlugins.compress;

      hexyl = pkgs.fetchFromGitHub {
        owner = "Reledia";
        repo = "hexyl.yazi";
        rev = "main";
        hash = "sha256-Xv1rfrwMNNDTgAuFLzpVrxytA2yX/CCexFt5QngaYDg=";
      };

    };

    keymap.mgr = {
      prepend_keymap = [
        {
          on = "M";
          run = "plugin mount";
          desc = "Mount partitions";
        }
        {
          on = "F";
          run = "plugin smart-filter";
          desc = "Smart filter";
        }
        {
          on = [
            "c"
            "y"
          ];
          run = "shell -- for path in %s; do echo \"file://$path\"; done | wl-copy -t text/uri-list";
          desc = "Copy file to clipboard";
        }
        {
          on = [
            "c"
            "C"
          ];
          run = "shell -- for path in %s; do cat \"$path\"; done | wl-copy --trim-newline";
          desc = "Copy file contents to clipboard";
        }
        {
          on = "C";
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

    settings = {
      mgr = {
        ratio = [
          1
          4
          3
        ];
        sort_dir_first = true;
        sort_by = "extension";
        sort_sensitive = false;
        sort_reverse = false;
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
        image_filter = "catmull-rom";
        image_quality = 75;
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      opener = {
        run = [
          {
            run = "\"$1\"";
            desc = "Run script";
            block = true;
            for = "linux";
          }
        ];
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
            run = "7z -r -tzip a \"compressed\" \"$1\"";
            desc = "Compress here";
            for = "linux";
          }
        ];
        reveal = [
          {
            run = "alacritty --working-directory \"$(dirname \"$1\")\" & disown";
            desc = "Reveal";
            for = "linux";
          }
        ];
        open = [
          {
            run = "xdg-open \"$1\" & disown";
            desc = "Open with default XDG";
            for = "linux";
          }
        ];
        extract = [
          {
            run = "ya pub extract --list \"$@\"";
            desc = "Extract here";
            for = "unix";
          }
        ];
        play = [
          {
            run = "xdg-open \"$1\" & disown";
            desc = "Play";
            for = "linux";
            orphan = true;
          }
          {
            run = "mpv --force-window \"$@\" & disown";
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
            url = "*/";
            use = [
              "open"
              "edit"
              "reveal"
              "compress"
              "code"
            ];
          }
          # Programming Language
          {
            mime = "text/{c,c++,c-header,c++-header,csharp,go,java,javascript,lua,markdown,objective-c,python,ruby,sql,yaml}";
            use = [
              "open"
              "code"
              "edit"
              "reveal"
            ];
          }
          # Shell script
          {
            mime = "text/shellscript";
            use = [
              "open"
              "run"
              "edit"
              "code"
              "reveal"
            ];
          }
          # Text
          {
            mime = "text/*";
            use = [
              "open"
              "edit"
              "code"
              "reveal"
            ];
          }
          # Image
          {
            mime = "image/*";
            use = [
              "open"
              "reveal"
            ];
          }
          # Media
          {
            mime = "{audio,video}/*";
            use = [
              "play"
              "open"
              "reveal"
            ];
          }
          # PDF - Ebook
          {
            mime = "application/{pdf,epub+zip}";
            use = [
              "open"
              "reveal"
            ];
          }
          # Archive
          {
            mime = "application/{,g}zip";
            use = [
              "extract"
              "open"
              "reveal"
            ];
          }
          {
            mime = "application/{tar,bzip*,7z-compressed,xz,rar}";
            use = [
              "extract"
              "open"
              "reveal"
            ];
          }
          # JSON
          {
            mime = "application/{json,x-ndjson}";
            use = [
              "open"
              "code"
              "edit"
              "reveal"
            ];
          }
          # Empty file
          {
            mime = "inode/empty";
            use = [
              "open"
              "edit"
              "reveal"
            ];
          }
          # Fallback
          {
            url = "*";
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
            url = "*.md";
            run = "glow";
          }
        ];
        prepend_fetchers = [
          {
            id = "git";
            url = "*";
            run = "git";
            group = "git";
          }
          {
            id = "git";
            url = "*/";
            run = "git";
            group = "git_dir";
          }
        ];

        fetchers = [
          # Mimetype
          {
            id = "mime";
            url = "*/";
            run = "mime.dir";
            prio = "high";
            group = "dir";
          }
          {
            id = "mime";
            url = "local://*";
            run = "mime.local";
            prio = "high";
            group = "local";
          }
          {
            id = "mime";
            url = "remote://*";
            run = "mime.remote";
            prio = "high";
            group = "remote";
          }
        ];

        spotters = [
          {
            url = "*/";
            run = "folder";
          }
          # Code
          {
            mime = "text/*";
            run = "code";
          }
          {
            mime = "application/{mbox,javascript,wine-extension-ini}";
            run = "code";
          }
          # Image
          {
            mime = "image/{avif,hei?,jxl}";
            run = "magick";
          }
          {
            mime = "image/svg+xml";
            run = "svg";
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
          # Virtual file system
          {
            mime = "vfs/*";
            run = "vfs";
          }
          # Error
          {
            mime = "null/*";
            run = "null";
          }
          # Fallback
          {
            url = "*";
            run = "file";
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
            url = "*/";
            run = "folder";
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
            mime = "application/{json,ndjson}";
            run = "json";
          }
          # Image
          {
            mime = "image/{avif,hei?,jxl}";
            run = "magick";
          }
          {
            mime = "image/svg+xml";
            run = "svg";
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
            mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
            run = "archive";
          }
          {
            mime = "application/{debian*-package,redhat-package-manager,rpm,android.package-archive}";
            run = "archive";
          }
          {
            url = "*.{AppImage,appimage}";
            run = "archive";
          }
          # Virtual Disk / Disk Image
          {
            mime = "application/{iso9660-image,qemu-disk,ms-wim,apple-diskimage}";
            run = "archive";
          }
          {
            mime = "application/virtualbox-{vhd,vhdx}";
            run = "archive";
          }
          {
            url = "*.{img,fat,ext,ext2,ext3,ext4,squashfs,ntfs,hfs,hfsx}";
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
            mime = "inode/empty";
            run = "empty";
          }
          # Virtual file system
          {
            mime = "vfs/*";
            run = "vfs";
          }
          # Error
          {
            mime = "null/*";
            run = "null";
          }
          # Fallback
          {
            url = "*";
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
