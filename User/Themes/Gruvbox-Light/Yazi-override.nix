{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

let
  colors = import ./Colors.nix;
  yazi-flavors = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "flavors";
    rev = "main";
    hash = "sha256-xYEVdDv0AzPYGwANiP1V5JEKg6k1JXEBeH5tHbPPFl4=";
  };
in
{
  programs.yazi.flavors = lib.mkForce {
    dracula = "${yazi-flavors}/dracula.yazi";
    flexoki-dark = pkgs.fetchFromGitHub {
      owner = "gosxrgxx";
      repo = "flexoki-dark.yazi";
      rev = "main";
      hash = "sha256-VQJIqUNklPDiXBSYGWUp099LXytlETUwGj03o/9HP5I=";
    };

    flexoki-light = pkgs.fetchFromGitHub {
      owner = "gosxrgxx";
      repo = "flexoki-dark.yazi";
      rev = "main";
      hash = "sha256-VQJIqUNklPDiXBSYGWUp099LXytlETUwGj03o/9HP5I=";
    };

    gruv-dark = pkgs.fetchFromGitHub {
      owner = "bennyyip";
      repo = "gruvbox-dark.yazi";
      rev = "main";
      hash = "sha256-9ZZHXP0Junaj6r80nE8oDNEU5WIKVdtz4g72BFzcSAM=";
    };
  };

  programs.yazi.theme = lib.mkForce {
    manager = {
      cwd = {
        fg = "${colors.bright_blue}";
      };
      hovered = {
        reversed = true;
      };
      preview_hovered = {
        bold = true;
      };
      find_keyword = {
        fg = "${colors.yellow}";
        bold = true;
        italic = true;
        underline = true;
      };
      find_position = {
        fg = "${colors.purple}";
        bg = "reset";
        bold = true;
        italic = true;
      };
      marker_copied = {
        fg = "${colors.bright_green}";
        bg = "${colors.bright_green}";
      };
      marker_cut = {
        fg = "${colors.bright_red}";
        bg = "${colors.bright_red}";
      };
      marker_marked = {
        fg = "${colors.bright_aqua}";
        bg = "${colors.bright_aqua}";
      };
      marker_selected = {
        fg = "${colors.bright_yellow}";
        bg = "${colors.bright_yellow}";
      };
      tab_active = {
        reversed = true;
      };
      tab_inactive = { };
      tab_width = 30;
      count_copied = {
        fg = "${colors.white}";
        bg = "${colors.green}";
      };
      count_cut = {
        fg = "${colors.white}";
        bg = "${colors.red}";
      };
      count_selected = {
        fg = "${colors.white}";
        bg = "${colors.yellow}";
      };
      border_symbol = "│";
      border_style = {
        fg = "${colors.bg2}";
      };
      syntect_theme = "";
    };
    status = {
      mode_normal = {
        bg = "${colors.bright_blue}";
        bold = true;
      };
      mode_select = {
        bg = "${colors.bright_purple}";
        bold = true;
      };
      mode_unset = {
        bg = "${colors.bright_red}";
        bold = true;
      };
      progress_label = {
        bold = true;
      };
      progress_normal = {
        fg = "${colors.bright_blue}";
        bg = "${colors.black}";
      };
      progress_error = {
        fg = "${colors.red}";
        bg = "${colors.black}";
      };
    };
    pick = {
      border = {
        fg = "${colors.bright_blue}";
      };
      active = {
        fg = "${colors.purple}";
        bold = true;
      };
      inactive = { };
    };
    input = {
      border = {
        fg = "${colors.bright_blue}";
      };
      title = { };
      value = { };
      selected = {
        reversed = true;
      };
    };
    confirm = {
      border = {
        fg = "${colors.bright_orange}";
      };
      title = {
        fg = "${colors.bright_orange}";
        bg = "${colors.bg1}";
      };
      content = {
      };
      list = {
        bold = true;
      };
      btn_yes = {
        reversed = true;
      };
      btn_no = {
      };
      btn_labels = [
        "  [Y]es  "
        "  (N)o  "
      ];
    };
    cmp = {
      border = {
        fg = "${colors.bright_blue}";
      };
      active = {
        reversed = true;
      };
      inactive = { };
      icon_file = "";
      icon_folder = "";
      icon_command = "";
    };
    tasks = {
      border = {
        fg = "${colors.bright_blue}";
      };
      title = { };
      hovered = {
        fg = "${colors.purple}";
        underline = true;
      };
    };
    which = {
      separator = " | ";
      cols = 3;
      mask = {
        bg = "${colors.bg1}";
      };
      cand = {
        fg = "${colors.bright_red}";
      };
      rest = {
        fg = "${colors.bright_purple}";
      };
      desc = {
        fg = "${colors.fg2}";
      };
      separator_style = {
        fg = "${colors.fg4}";
      };
    };
    help = {
      on = {
        fg = "${colors.blue}";
      };
      run = {
        fg = "${colors.bright_orange}";
      };
      desc = { };
      hovered = {
        reversed = true;
        bold = true;
      };
      footer = {
        fg = "${colors.fg0}";
        bg = "${colors.bg2}";
      };
    };
    notify = {
      title_info = {
        fg = "${colors.green}";
      };
      title_warn = {
        fg = "${colors.yellow}";
      };
      title_error = {
        fg = "${colors.red}";
      };
      icon_info = "";
      icon_warn = "";
      icon_error = "";
    };
    filetype = {
      rules = [
        {
          mime = "image/*";
          fg = "${colors.yellow}";
        }
        {
          mime = "{audio,video}/*";
          fg = "${colors.purple}";
        }
        {
          mime = "application/{,g}zip";
          fg = "${colors.bright_black}";
        }
        {
          mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}";
          fg = "${colors.bright_black}";
        }
        {
          mime = "application/{pdf,doc,rtf,vnd.*}";
          fg = "${colors.white}";
        }
        {
          mime = "inode/empty";
          fg = "${colors.bright_black}";
        }
        {
          name = "*";
          is = "orphan";
          fg = "${colors.faded_green}";
        }
        {
          name = "*";
          is = "exec";
          italic = true;
          bold = true;
        }
        {
          name = "*";
          is = "dummy";
          bg = "${colors.faded_green}";
        }
        {
          name = "*/";
          is = "dummy";
          bg = "${colors.faded_green}";
        }
        {
          name = "*";
          is = "link";
          fg = "${colors.faded_green}";
        }
        {
          name = "*/";
          is = "link";
          fg = "${colors.faded_green}";
        }
        {
          name = "*/";
          fg = "${colors.faded_white}";
        }
      ];
    };
    icon = {
      dirs = [
        {
          name = ".config";
          text = "";
        }
        {
          name = ".git";
          text = "";
        }
        {
          name = "Desktop";
          text = "";
        }
        {
          name = "Development";
          text = "";
        }
        {
          name = "Documents";
          text = "";
        }
        {
          name = "Downloads";
          text = "";
        }
        {
          name = "Library";
          text = "";
        }
        {
          name = "Movies";
          text = "";
        }
        {
          name = "Music";
          text = "";
        }
        {
          name = "Pictures";
          text = "";
        }
        {
          name = "Images";
          text = "";
        }
        {
          name = "Public";
          text = "";
        }
        {
          name = "Videos";
          text = "";
        }
      ];
      files = [
        {
          name = ".babelrc";
          text = "";
          fg = "${colors.bright_green}";
        }
        {
          name = ".bash_profile";
          text = "";
          fg = "${colors.bright_green}";
        }
        {
          name = ".bashrc";
          text = "";
          fg = "${colors.bright_green}";
        }
        {
          name = ".dockerignore";
          text = "󰡨";
          fg = "${colors.blue}";
        }
        {
          name = ".ds_store";
          text = "";
          fg = "${colors.bright_blue}";
        }
        {
          name = ".editorconfig";
          text = "";
          fg = "${colors.bright_white}";
        }
        {
          name = ".env";
          text = "";
          fg = "${colors.bright_yellow}";
        }
        {
          name = ".eslintignore";
          text = "";
          fg = "${colors.faded_purple}";

        }
        {
          name = ".eslintrc";
          text = "";
          fg = "${colors.faded_purple}";

        }
        {
          name = ".gitattributes";
          text = "";
          fg = "${colors.bright_red}";

        }
        {
          name = ".gitconfig";
          text = "";
          fg = "${colors.bright_red}";

        }
        {
          name = ".gitignore";
          text = "";
          fg = "${colors.bright_red}";
        }
        {
          name = ".gitlab-ci.yml";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = ".gitmodules";
          text = "";
          fg = "${colors.bright_red}";

        }
        {
          name = ".gtkrc-2.0";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = ".gvimrc";
          text = "";
          fg = "${colors.green}";

        }
        {
          name = ".luaurc";
          text = "";
          fg = "${colors.blue}";

        }
        {
          name = ".mailmap";
          text = "󰊢";
          fg = "${colors.bright_blue}";

        }
        {
          name = ".npmignore";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = ".npmrc";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = ".prettierrc";
          text = "";
          fg = "${colors.blue}";

        }
        {
          name = ".settings.json";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = ".SRCINFO";
          text = "󰣇";
          fg = "${colors.bright_blue}";

        }
        {
          name = ".vimrc";
          text = "";
          fg = "${colors.green}";

        }
        {
          name = ".Xauthority";
          text = "";
          fg = "${colors.orange}";

        }
        {
          name = ".xinitrc";
          text = "";
          fg = "${colors.orange}";

        }
        {
          name = ".Xresources";
          text = "";
          fg = "${colors.orange}";

        }
        {
          name = ".xsession";
          text = "";
          fg = "${colors.orange}";

        }
        {
          name = ".zprofile";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = ".zshenv";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = ".zshrc";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "_gvimrc";
          text = "";
          fg = "${colors.green}";

        }
        {
          name = "_vimrc";
          text = "";
          fg = "${colors.green}";

        }
        {
          name = "avif";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "brewfile";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "bspwmrc";
          text = "";
          fg = "${colors.faded_black}";

        }
        {
          name = "build";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "build.gradle";
          text = "";
          fg = "${colors.faded_blue}";

        }
        {
          name = "build.zig.zon";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "cantorrc";
          text = "";
          fg = "${colors.blue}";

        }
        {
          name = "checkhealth";
          text = "󰓙";
          fg = "${colors.bright_blue}";

        }
        {
          name = "cmakelists.txt";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "commit_editmsg";
          text = "";
          fg = "${colors.bright_red}";

        }
        {
          name = "compose.yaml";
          text = "󰡨";
          fg = "${colors.blue}";

        }
        {
          name = "compose.yml";
          text = "󰡨";
          fg = "${colors.blue}";

        }
        {
          name = "config";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "containerfile";
          text = "󰡨";
          fg = "${colors.blue}";

        }
        {
          name = "copying";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "copying.lesser";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "docker-compose.yaml";
          text = "󰡨";
          fg = "${colors.blue}";

        }
        {
          name = "docker-compose.yml";
          text = "󰡨";
          fg = "${colors.blue}";

        }
        {
          name = "dockerfile";
          text = "󰡨";
          fg = "${colors.blue}";

        }
        {
          name = "ext_typoscript_setup.txt";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "favicon.ico";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "fp-info-cache";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "fp-lib-table";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "FreeCAD.conf";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "gemfile$";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "gnumakefile";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "gradle-wrapper.properties";
          text = "";
          fg = "${colors.faded_blue}";

        }
        {
          name = "gradle.properties";
          text = "";
          fg = "${colors.faded_blue}";

        }
        {
          name = "gradlew";
          text = "";
          fg = "${colors.faded_blue}";

        }
        {
          name = "groovy";
          text = "";
          fg = "${colors.bright_blue}";

        }
        {
          name = "gruntfile.babel.js";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "gruntfile.coffee";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "gruntfile.js";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "gruntfile.ts";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "gtkrc";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "gulpfile.babel.js";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "gulpfile.coffee";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "gulpfile.js";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "gulpfile.ts";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "hyprland.conf";
          text = "";
          fg = "${colors.bright_aqua}";

        }
        {
          name = "i3blocks.conf";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "i3status.conf";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "kalgebrarc";
          text = "";
          fg = "${colors.blue}";

        }
        {
          name = "kdeglobals";
          text = "";
          fg = "${colors.blue}";

        }
        {
          name = "kdenlive-layoutsrc";
          text = "";
          fg = "${colors.bright_blue}";

        }
        {
          name = "kdenliverc";
          text = "";
          fg = "${colors.bright_blue}";

        }
        {
          name = "kritadisplayrc";
          text = "";
          fg = "${colors.bright_purple}";

        }
        {
          name = "kritarc";
          text = "";
          fg = "${colors.bright_purple}";

        }
        {
          name = "license";
          text = "";
          fg = "${colors.bright_yellow}";

        }
        {
          name = "lxde-rc.xml";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "lxqt.conf";
          text = "";
          fg = "${colors.blue}";

        }
        {
          name = "makefile";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "mix.lock";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "mpv.conf";
          text = "";
          fg = "${colors.faded_purple}";

        }
        {
          name = "node_modules";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "package-lock.json";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "package.json";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "PKGBUILD";
          text = "";
          fg = "${colors.bright_blue}";

        }
        {
          name = "platformio.ini";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "pom.xml";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "procfile";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "PrusaSlicer.ini";
          text = "";
          fg = "${colors.orange}";

        }
        {
          name = "PrusaSlicerGcodeViewer.ini";
          text = "";
          fg = "${colors.orange}";

        }
        {
          name = "py.typed";
          text = "";
          fg = "#ffbc03";

        }
        {
          name = "QtProject.conf";
          text = "";
          fg = "#40cd52";

        }
        {
          name = "R";
          text = "󰟔";
          fg = "#2266ba";

        }
        {
          name = "r";
          text = "󰟔";
          fg = "#2266ba";

        }
        {
          name = "rakefile";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "rmd";
          text = "";
          fg = "#519aba";

        }
        {
          name = "settings.gradle";
          text = "";
          fg = "${colors.faded_blue}";

        }
        {
          name = "svelte.config.js";
          text = "";
          fg = "#ff3e00";

        }
        {
          name = "sxhkdrc";
          text = "";
          fg = "${colors.faded_black}";

        }
        {
          name = "sym-lib-table";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "tailwind.config.js";
          text = "󱏿";
          fg = "#20c2e3";

        }
        {
          name = "tailwind.config.mjs";
          text = "󱏿";
          fg = "#20c2e3";

        }
        {
          name = "tailwind.config.ts";
          text = "󱏿";
          fg = "#20c2e3";

        }
        {
          name = "tmux.conf";
          text = "";
          fg = "#14ba19";

        }
        {
          name = "tmux.conf.local";
          text = "";
          fg = "#14ba19";

        }
        {
          name = "tsconfig.json";
          text = "";
          fg = "#519aba";

        }
        {
          name = "unlicense";
          text = "";
          fg = "${colors.bright_yellow}";

        }
        {
          name = "vagrantfile$";
          text = "";
          fg = "#1563ff";

        }
        {
          name = "vlcrc";
          text = "󰕼";
          fg = "#ee7a00";

        }
        {
          name = "webpack";
          text = "󰜫";
          fg = "#519aba";

        }
        {
          name = "weston.ini";
          text = "";
          fg = "#ffbb01";

        }
        {
          name = "workspace";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "xmobarrc";
          text = "";
          fg = "#fd4d5d";

        }
        {
          name = "xmobarrc.hs";
          text = "";
          fg = "#fd4d5d";

        }
        {
          name = "xmonad.hs";
          text = "";
          fg = "#fd4d5d";

        }
        {
          name = "xorg.conf";
          text = "";
          fg = "${colors.orange}";

        }
        {
          name = "xsettingsd.conf";
          text = "";
          fg = "${colors.orange}";

        }
      ];
      exts = [
        {
          name = "3gp";
          text = "";
          fg = "#fd971f";

        }
        {
          name = "3mf";
          text = "󰆧";
          fg = "#888888";

        }
        {
          name = "7z";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "a";
          text = "";
          fg = "#dcddd6";

        }
        {
          name = "aac";
          text = "";
          fg = "#00afff";

        }
        {
          name = "ai";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "aif";
          text = "";
          fg = "#00afff";

        }
        {
          name = "aiff";
          text = "";
          fg = "#00afff";

        }
        {
          name = "android";
          text = "";
          fg = "#34a853";

        }
        {
          name = "ape";
          text = "";
          fg = "#00afff";

        }
        {
          name = "apk";
          text = "";
          fg = "#34a853";

        }
        {
          name = "app";
          text = "";
          fg = "#9f0500";

        }
        {
          name = "applescript";
          text = "";
          fg = "#6d8085";

        }
        {
          name = "asc";
          text = "󰦝";
          fg = "#576d7f";

        }
        {
          name = "ass";
          text = "󰨖";
          fg = "#ffb713";

        }
        {
          name = "astro";
          text = "";
          fg = "#e23f67";

        }
        {
          name = "awk";
          text = "";
          fg = "#4d5a5e";

        }
        {
          name = "azcli";
          text = "";
          fg = "#0078d4";

        }
        {
          name = "bak";
          text = "󰁯";
          fg = "${colors.bright_black}";

        }
        {
          name = "bash";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "bat";
          text = "";
          fg = "#c1f12e";

        }
        {
          name = "bazel";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "bib";
          text = "󱉟";
          fg = "${colors.bright_green}";

        }
        {
          name = "bicep";
          text = "";
          fg = "#519aba";

        }
        {
          name = "bicepparam";
          text = "";
          fg = "#9f74b3";

        }
        {
          name = "bin";
          text = "";
          fg = "#9f0500";

        }
        {
          name = "blade.php";
          text = "";
          fg = "#f05340";

        }
        {
          name = "blend";
          text = "󰂫";
          fg = "#ea7600";

        }
        {
          name = "blp";
          text = "󰺾";
          fg = "#5796e2";

        }
        {
          name = "bmp";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "brep";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "bz";
          text = "";
          fg = "#eca517";

        }
        {
          name = "bz2";
          text = "";
          fg = "#eca517";

        }
        {
          name = "bz3";
          text = "";
          fg = "#eca517";

        }
        {
          name = "bzl";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "c";
          text = "";
          fg = "#599eff";

        }
        {
          name = "c++";
          text = "";
          fg = "#f34b7d";

        }
        {
          name = "cache";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "cast";
          text = "";
          fg = "#fd971f";

        }
        {
          name = "cbl";
          text = "⚙";
          fg = "#005ca5";

        }
        {
          name = "cc";
          text = "";
          fg = "#f34b7d";

        }
        {
          name = "ccm";
          text = "";
          fg = "#f34b7d";

        }
        {
          name = "cfg";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "cjs";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "clj";
          text = "";
          fg = "#8dc149";

        }
        {
          name = "cljc";
          text = "";
          fg = "#8dc149";

        }
        {
          name = "cljd";
          text = "";
          fg = "#519aba";

        }
        {
          name = "cljs";
          text = "";
          fg = "#519aba";

        }
        {
          name = "cmake";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "cob";
          text = "⚙";
          fg = "#005ca5";

        }
        {
          name = "cobol";
          text = "⚙";
          fg = "#005ca5";

        }
        {
          name = "coffee";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "conf";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "config.ru";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "cp";
          text = "";
          fg = "#519aba";

        }
        {
          name = "cpp";
          text = "";
          fg = "#519aba";

        }
        {
          name = "cppm";
          text = "";
          fg = "#519aba";

        }
        {
          name = "cpy";
          text = "⚙";
          fg = "#005ca5";

        }
        {
          name = "cr";
          text = "";
          fg = "#c8c8c8";

        }
        {
          name = "crdownload";
          text = "";
          fg = "#44cda8";

        }
        {
          name = "cs";
          text = "󰌛";
          fg = "#596706";

        }
        {
          name = "csh";
          text = "";
          fg = "#4d5a5e";

        }
        {
          name = "cshtml";
          text = "󱦗";
          fg = "#512bd4";

        }
        {
          name = "cson";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "csproj";
          text = "󰪮";
          fg = "#512bd4";

        }
        {
          name = "css";
          text = "";
          fg = "#42a5f5";

        }
        {
          name = "csv";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "cts";
          text = "";
          fg = "#519aba";

        }
        {
          name = "cu";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "cue";
          text = "󰲹";
          fg = "#ed95ae";

        }
        {
          name = "cuh";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "cxx";
          text = "";
          fg = "#519aba";

        }
        {
          name = "cxxm";
          text = "";
          fg = "#519aba";

        }
        {
          name = "d";
          text = "";
          fg = "#427819";

        }
        {
          name = "d.ts";
          text = "";
          fg = "#d59855";

        }
        {
          name = "dart";
          text = "";
          fg = "#03589c";

        }
        {
          name = "db";
          text = "";
          fg = "#dad8d8";

        }
        {
          name = "dconf";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "desktop";
          text = "";
          fg = "#563d7c";

        }
        {
          name = "diff";
          text = "";
          fg = "${colors.bright_blue}";

        }
        {
          name = "dll";
          text = "";
          fg = "#4d2c0b";

        }
        {
          name = "doc";
          text = "󰈬";
          fg = "${colors.faded_blue}";

        }
        {
          name = "Dockerfile";
          text = "󰡨";
          fg = "${colors.blue}";

        }
        {
          name = "docx";
          text = "󰈬";
          fg = "${colors.faded_blue}";

        }
        {
          name = "dot";
          text = "󱁉";
          fg = "#30638e";

        }
        {
          name = "download";
          text = "";
          fg = "#44cda8";

        }
        {
          name = "drl";
          text = "";
          fg = "#ffafaf";

        }
        {
          name = "dropbox";
          text = "";
          fg = "#0061fe";

        }
        {
          name = "dump";
          text = "";
          fg = "#dad8d8";

        }
        {
          name = "dwg";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "dxf";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "ebook";
          text = "";
          fg = "#eab16d";

        }
        {
          name = "edn";
          text = "";
          fg = "#519aba";

        }
        {
          name = "eex";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "ejs";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "el";
          text = "";
          fg = "#8172be";

        }
        {
          name = "elc";
          text = "";
          fg = "#8172be";

        }
        {
          name = "elf";
          text = "";
          fg = "#9f0500";

        }
        {
          name = "elm";
          text = "";
          fg = "#519aba";

        }
        {
          name = "eln";
          text = "";
          fg = "#8172be";

        }
        {
          name = "env";
          text = "";
          fg = "${colors.bright_yellow}";

        }
        {
          name = "eot";
          text = "";
          fg = "#ececec";

        }
        {
          name = "epp";
          text = "";
          fg = "#ffa61a";

        }
        {
          name = "epub";
          text = "";
          fg = "#eab16d";

        }
        {
          name = "erb";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "erl";
          text = "";
          fg = "#b83998";

        }
        {
          name = "ex";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "exe";
          text = "";
          fg = "#9f0500";

        }
        {
          name = "exs";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "f#";
          text = "";
          fg = "#519aba";

        }
        {
          name = "f3d";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "f90";
          text = "󱈚";
          fg = "#734f96";

        }
        {
          name = "fbx";
          text = "󰆧";
          fg = "#888888";

        }
        {
          name = "fcbak";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fcmacro";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fcmat";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fcparam";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fcscript";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fcstd";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fcstd1";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fctb";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fctl";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "fdmdownload";
          text = "";
          fg = "#44cda8";

        }
        {
          name = "fish";
          text = "";
          fg = "#4d5a5e";

        }
        {
          name = "flac";
          text = "";
          fg = "#0075aa";

        }
        {
          name = "flc";
          text = "";
          fg = "#ececec";

        }
        {
          name = "flf";
          text = "";
          fg = "#ececec";

        }
        {
          name = "fnl";
          text = "";
          fg = "#fff3d7";

        }
        {
          name = "fs";
          text = "";
          fg = "#519aba";

        }
        {
          name = "fsi";
          text = "";
          fg = "#519aba";

        }
        {
          name = "fsscript";
          text = "";
          fg = "#519aba";

        }
        {
          name = "fsx";
          text = "";
          fg = "#519aba";

        }
        {
          name = "gcode";
          text = "󰐫";
          fg = "#1471ad";

        }
        {
          name = "gd";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "gemspec";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "gif";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "git";
          text = "";
          fg = "#f14c28";

        }
        {
          name = "glb";
          text = "";
          fg = "#ffb13b";

        }
        {
          name = "gnumakefile";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "go";
          text = "";
          fg = "#519aba";

        }
        {
          name = "godot";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "gql";
          text = "";
          fg = "#e535ab";

        }
        {
          name = "graphql";
          text = "";
          fg = "#e535ab";

        }
        {
          name = "gresource";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "gv";
          text = "󱁉";
          fg = "#30638e";

        }
        {
          name = "gz";
          text = "";
          fg = "#eca517";

        }
        {
          name = "h";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "haml";
          text = "";
          fg = "#eaeae1";

        }
        {
          name = "hbs";
          text = "";
          fg = "#f0772b";

        }
        {
          name = "heex";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "hex";
          text = "";
          fg = "#2e63ff";

        }
        {
          name = "hh";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "hpp";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "hrl";
          text = "";
          fg = "#b83998";

        }
        {
          name = "hs";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "htm";
          text = "";
          fg = "#e34c26";

        }
        {
          name = "html";
          text = "";
          fg = "#e44d26";

        }
        {
          name = "huff";
          text = "󰡘";
          fg = "#4242c7";

        }
        {
          name = "hurl";
          text = "";
          fg = "#ff0288";

        }
        {
          name = "hx";
          text = "";
          fg = "#ea8220";

        }
        {
          name = "hxx";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "ical";
          text = "";
          fg = "#2b2e83";

        }
        {
          name = "icalendar";
          text = "";
          fg = "#2b2e83";

        }
        {
          name = "ico";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "ics";
          text = "";
          fg = "#2b2e83";

        }
        {
          name = "ifb";
          text = "";
          fg = "#2b2e83";

        }
        {
          name = "ifc";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "ige";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "iges";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "igs";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "image";
          text = "";
          fg = "#d0bec8";

        }
        {
          name = "img";
          text = "";
          fg = "#d0bec8";

        }
        {
          name = "import";
          text = "";
          fg = "#ececec";

        }
        {
          name = "info";
          text = "";
          fg = "#ffffcd";

        }
        {
          name = "ini";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "ino";
          text = "";
          fg = "#56b6c2";

        }
        {
          name = "ipynb";
          text = "";
          fg = "#51a0cf";

        }
        {
          name = "iso";
          text = "";
          fg = "#d0bec8";

        }
        {
          name = "ixx";
          text = "";
          fg = "#519aba";

        }
        {
          name = "java";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "jl";
          text = "";
          fg = "#a270ba";

        }
        {
          name = "jpeg";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "jpg";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "js";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "json";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "json5";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "jsonc";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "jsx";
          text = "";
          fg = "#20c2e3";

        }
        {
          name = "jwmrc";
          text = "";
          fg = "#0078cd";

        }
        {
          name = "jxl";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "kbx";
          text = "󰯄";
          fg = "#737672";

        }
        {
          name = "kdb";
          text = "";
          fg = "#529b34";

        }
        {
          name = "kdbx";
          text = "";
          fg = "#529b34";

        }
        {
          name = "kdenlive";
          text = "";
          fg = "${colors.bright_blue}";

        }
        {
          name = "kdenlivetitle";
          text = "";
          fg = "${colors.bright_blue}";

        }
        {
          name = "kicad_dru";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "kicad_mod";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "kicad_pcb";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "kicad_prl";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "kicad_pro";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "kicad_sch";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "kicad_sym";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "kicad_wks";
          text = "";
          fg = "${colors.bright_white}";

        }
        {
          name = "ko";
          text = "";
          fg = "#dcddd6";

        }
        {
          name = "kpp";
          text = "";
          fg = "${colors.bright_purple}";

        }
        {
          name = "kra";
          text = "";
          fg = "${colors.bright_purple}";

        }
        {
          name = "krz";
          text = "";
          fg = "${colors.bright_purple}";

        }
        {
          name = "ksh";
          text = "";
          fg = "#4d5a5e";

        }
        {
          name = "kt";
          text = "";
          fg = "#7f52ff";

        }
        {
          name = "kts";
          text = "";
          fg = "#7f52ff";

        }
        {
          name = "lck";
          text = "";
          fg = "#bbbbbb";

        }
        {
          name = "leex";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "less";
          text = "";
          fg = "#563d7c";

        }
        {
          name = "lff";
          text = "";
          fg = "#ececec";

        }
        {
          name = "lhs";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "lib";
          text = "";
          fg = "#4d2c0b";

        }
        {
          name = "license";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "liquid";
          text = "";
          fg = "#95bf47";

        }
        {
          name = "lock";
          text = "";
          fg = "#bbbbbb";

        }
        {
          name = "log";
          text = "󰌱";
          fg = "#dddddd";

        }
        {
          name = "lrc";
          text = "󰨖";
          fg = "#ffb713";

        }
        {
          name = "lua";
          text = "";
          fg = "#51a0cf";

        }
        {
          name = "luac";
          text = "";
          fg = "#51a0cf";

        }
        {
          name = "luau";
          text = "";
          fg = "${colors.blue}";

        }
        {
          name = "m";
          text = "";
          fg = "#599eff";

        }
        {
          name = "m3u";
          text = "󰲹";
          fg = "#ed95ae";

        }
        {
          name = "m3u8";
          text = "󰲹";
          fg = "#ed95ae";

        }
        {
          name = "m4a";
          text = "";
          fg = "#00afff";

        }
        {
          name = "m4v";
          text = "";
          fg = "#fd971f";

        }
        {
          name = "magnet";
          text = "";
          fg = "#a51b16";

        }
        {
          name = "makefile";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "markdown";
          text = "";
          fg = "#dddddd";

        }
        {
          name = "material";
          text = "󰔉";
          fg = "#b83998";

        }
        {
          name = "md";
          text = "";
          fg = "#dddddd";

        }
        {
          name = "md5";
          text = "󰕥";
          fg = "#8c86af";

        }
        {
          name = "mdx";
          text = "";
          fg = "#519aba";

        }
        {
          name = "mint";
          text = "󰌪";
          fg = "#87c095";

        }
        {
          name = "mjs";
          text = "";
          fg = "#f1e05a";

        }
        {
          name = "mk";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "mkv";
          text = "";
          fg = "#fd971f";

        }
        {
          name = "ml";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "mli";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "mm";
          text = "";
          fg = "#519aba";

        }
        {
          name = "mo";
          text = "∞";
          fg = "#9772fb";

        }
        {
          name = "mobi";
          text = "";
          fg = "#eab16d";

        }
        {
          name = "mov";
          text = "";
          fg = "#fd971f";

        }
        {
          name = "mp3";
          text = "";
          fg = "#00afff";

        }
        {
          name = "mp4";
          text = "";
          fg = "#fd971f";

        }
        {
          name = "mpp";
          text = "";
          fg = "#519aba";

        }
        {
          name = "msf";
          text = "";
          fg = "#137be1";

        }
        {
          name = "mts";
          text = "";
          fg = "#519aba";

        }
        {
          name = "mustache";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "nfo";
          text = "";
          fg = "#ffffcd";

        }
        {
          name = "nim";
          text = "";
          fg = "#f3d400";

        }
        {
          name = "nix";
          text = "";
          fg = "#7ebae4";

        }
        {
          name = "nswag";
          text = "";
          fg = "#85ea2d";

        }
        {
          name = "nu";
          text = ">";
          fg = "#3aa675";

        }
        {
          name = "o";
          text = "";
          fg = "#9f0500";

        }
        {
          name = "obj";
          text = "󰆧";
          fg = "#888888";

        }
        {
          name = "ogg";
          text = "";
          fg = "#0075aa";

        }
        {
          name = "opus";
          text = "";
          fg = "#0075aa";

        }
        {
          name = "org";
          text = "";
          fg = "#77aa99";

        }
        {
          name = "otf";
          text = "";
          fg = "#ececec";

        }
        {
          name = "out";
          text = "";
          fg = "#9f0500";

        }
        {
          name = "part";
          text = "";
          fg = "#44cda8";

        }
        {
          name = "patch";
          text = "";
          fg = "${colors.bright_blue}";

        }
        {
          name = "pck";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "pcm";
          text = "";
          fg = "#0075aa";

        }
        {
          name = "pdf";
          text = "";
          fg = "${colors.bright_red}";

        }
        {
          name = "php";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "pl";
          text = "";
          fg = "#519aba";

        }
        {
          name = "pls";
          text = "󰲹";
          fg = "#ed95ae";

        }
        {
          name = "ply";
          text = "󰆧";
          fg = "#888888";

        }
        {
          name = "pm";
          text = "";
          fg = "#519aba";

        }
        {
          name = "png";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "po";
          text = "";
          fg = "#2596be";

        }
        {
          name = "pot";
          text = "";
          fg = "#2596be";

        }
        {
          name = "pp";
          text = "";
          fg = "#ffa61a";

        }
        {
          name = "ppt";
          text = "󰈧";
          fg = "${colors.bright_red}";

        }
        {
          name = "prisma";
          text = "";
          fg = "#5a67d8";

        }
        {
          name = "pro";
          text = "";
          fg = "#e4b854";

        }
        {
          name = "ps1";
          text = "󰨊";
          fg = "#4273ca";

        }
        {
          name = "psb";
          text = "";
          fg = "#519aba";

        }
        {
          name = "psd";
          text = "";
          fg = "#519aba";

        }
        {
          name = "psd1";
          text = "󰨊";
          fg = "#6975c4";

        }
        {
          name = "psm1";
          text = "󰨊";
          fg = "#6975c4";

        }
        {
          name = "pub";
          text = "󰷖";
          fg = "#e3c58e";

        }
        {
          name = "pxd";
          text = "";
          fg = "#5aa7e4";

        }
        {
          name = "pxi";
          text = "";
          fg = "#5aa7e4";

        }
        {
          name = "py";
          text = "";
          fg = "#ffbc03";

        }
        {
          name = "pyc";
          text = "";
          fg = "#ffe291";

        }
        {
          name = "pyd";
          text = "";
          fg = "#ffe291";

        }
        {
          name = "pyi";
          text = "";
          fg = "#ffbc03";

        }
        {
          name = "pyo";
          text = "";
          fg = "#ffe291";

        }
        {
          name = "pyx";
          text = "";
          fg = "#5aa7e4";

        }
        {
          name = "qm";
          text = "";
          fg = "#2596be";

        }
        {
          name = "qml";
          text = "";
          fg = "#40cd52";

        }
        {
          name = "qrc";
          text = "";
          fg = "#40cd52";

        }
        {
          name = "qss";
          text = "";
          fg = "#40cd52";

        }
        {
          name = "query";
          text = "";
          fg = "#90a850";

        }
        {
          name = "r";
          text = "󰟔";
          fg = "#2266ba";

        }
        {
          name = "rake";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "rar";
          text = "";
          fg = "#eca517";

        }
        {
          name = "razor";
          text = "󱦘";
          fg = "#512bd4";

        }
        {
          name = "rb";
          text = "";
          fg = "${colors.faded_red}";

        }
        {
          name = "res";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "resi";
          text = "";
          fg = "#f55385";

        }
        {
          name = "rlib";
          text = "";
          fg = "#dea584";

        }
        {
          name = "rmd";
          text = "";
          fg = "#519aba";

        }
        {
          name = "rproj";
          text = "󰗆";
          fg = "#358a5b";

        }
        {
          name = "rs";
          text = "";
          fg = "#dea584";

        }
        {
          name = "rss";
          text = "";
          fg = "#fb9d3b";

        }
        {
          name = "sass";
          text = "";
          fg = "#f55385";

        }
        {
          name = "sbt";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "sc";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "scad";
          text = "";
          fg = "#f9d72c";

        }
        {
          name = "scala";
          text = "";
          fg = "${colors.red}";

        }
        {
          name = "scm";
          text = "󰘧";
          fg = "#eeeeee";

        }
        {
          name = "scss";
          text = "";
          fg = "#f55385";

        }
        {
          name = "sh";
          text = "";
          fg = "#4d5a5e";

        }
        {
          name = "sha1";
          text = "󰕥";
          fg = "#8c86af";

        }
        {
          name = "sha224";
          text = "󰕥";
          fg = "#8c86af";

        }
        {
          name = "sha256";
          text = "󰕥";
          fg = "#8c86af";

        }
        {
          name = "sha384";
          text = "󰕥";
          fg = "#8c86af";

        }
        {
          name = "sha512";
          text = "󰕥";
          fg = "#8c86af";

        }
        {
          name = "sig";
          text = "λ";
          fg = "${colors.bright_orange}";

        }
        {
          name = "signature";
          text = "λ";
          fg = "${colors.bright_orange}";

        }
        {
          name = "skp";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "sldasm";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "sldprt";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "slim";
          text = "";
          fg = "#e34c26";

        }
        {
          name = "sln";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "slvs";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "sml";
          text = "λ";
          fg = "${colors.bright_orange}";

        }
        {
          name = "so";
          text = "";
          fg = "#dcddd6";

        }
        {
          name = "sol";
          text = "";
          fg = "#519aba";

        }
        {
          name = "spec.js";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "spec.jsx";
          text = "";
          fg = "#20c2e3";

        }
        {
          name = "spec.ts";
          text = "";
          fg = "#519aba";

        }
        {
          name = "spec.tsx";
          text = "";
          fg = "#1354bf";

        }
        {
          name = "sql";
          text = "";
          fg = "#dad8d8";

        }
        {
          name = "sqlite";
          text = "";
          fg = "#dad8d8";

        }
        {
          name = "sqlite3";
          text = "";
          fg = "#dad8d8";

        }
        {
          name = "srt";
          text = "󰨖";
          fg = "#ffb713";

        }
        {
          name = "ssa";
          text = "󰨖";
          fg = "#ffb713";

        }
        {
          name = "ste";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "step";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "stl";
          text = "󰆧";
          fg = "#888888";

        }
        {
          name = "stp";
          text = "󰻫";
          fg = "#839463";

        }
        {
          name = "strings";
          text = "";
          fg = "#2596be";

        }
        {
          name = "styl";
          text = "";
          fg = "#8dc149";

        }
        {
          name = "sub";
          text = "󰨖";
          fg = "#ffb713";

        }
        {
          name = "sublime";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "suo";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "sv";
          text = "󰍛";
          fg = "${colors.green}";

        }
        {
          name = "svelte";
          text = "";
          fg = "#ff3e00";

        }
        {
          name = "svg";
          text = "󰜡";
          fg = "#ffb13b";

        }
        {
          name = "svh";
          text = "󰍛";
          fg = "${colors.green}";

        }
        {
          name = "swift";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "t";
          text = "";
          fg = "#519aba";

        }
        {
          name = "tbc";
          text = "󰛓";
          fg = "#1e5cb3";

        }
        {
          name = "tcl";
          text = "󰛓";
          fg = "#1e5cb3";

        }
        {
          name = "templ";
          text = "";
          fg = "#dbbd30";

        }
        {
          name = "terminal";
          text = "";
          fg = "#31b53e";

        }
        {
          name = "test.js";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "test.jsx";
          text = "";
          fg = "#20c2e3";

        }
        {
          name = "test.ts";
          text = "";
          fg = "#519aba";

        }
        {
          name = "test.tsx";
          text = "";
          fg = "#1354bf";

        }
        {
          name = "tex";
          text = "";
          fg = "#3d6117";

        }
        {
          name = "tf";
          text = "";
          fg = "#5f43e9";

        }
        {
          name = "tfvars";
          text = "";
          fg = "#5f43e9";

        }
        {
          name = "tgz";
          text = "";
          fg = "#eca517";

        }
        {
          name = "tmux";
          text = "";
          fg = "#14ba19";

        }
        {
          name = "toml";
          text = "";
          fg = "#9c4221";

        }
        {
          name = "torrent";
          text = "";
          fg = "#44cda8";

        }
        {
          name = "tres";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "ts";
          text = "";
          fg = "#519aba";

        }
        {
          name = "tscn";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "tsconfig";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "tsx";
          text = "";
          fg = "#1354bf";

        }
        {
          name = "ttf";
          text = "";
          fg = "#ececec";

        }
        {
          name = "twig";
          text = "";
          fg = "#8dc149";

        }
        {
          name = "txt";
          text = "󰈙";
          fg = "${colors.fg3}";

        }
        {
          name = "txz";
          text = "";
          fg = "#eca517";

        }
        {
          name = "typoscript";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "ui";
          text = "";
          fg = "#0c306e";

        }
        {
          name = "v";
          text = "󰍛";
          fg = "${colors.green}";

        }
        {
          name = "vala";
          text = "";
          fg = "#7239b3";

        }
        {
          name = "vh";
          text = "󰍛";
          fg = "${colors.green}";

        }
        {
          name = "vhd";
          text = "󰍛";
          fg = "${colors.green}";

        }
        {
          name = "vhdl";
          text = "󰍛";
          fg = "${colors.green}";

        }
        {
          name = "vim";
          text = "";
          fg = "${colors.green}";

        }
        {
          name = "vsh";
          text = "";
          fg = "#5d87bf";

        }
        {
          name = "vsix";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "vue";
          text = "";
          fg = "#8dc149";

        }
        {
          name = "wasm";
          text = "";
          fg = "#5c4cdb";

        }
        {
          name = "wav";
          text = "";
          fg = "#00afff";

        }
        {
          name = "webm";
          text = "";
          fg = "#fd971f";

        }
        {
          name = "webmanifest";
          text = "";
          fg = "#f1e05a";

        }
        {
          name = "webp";
          text = "";
          fg = "${colors.purple}";

        }
        {
          name = "webpack";
          text = "󰜫";
          fg = "#519aba";

        }
        {
          name = "wma";
          text = "";
          fg = "#00afff";

        }
        {
          name = "woff";
          text = "";
          fg = "#ececec";

        }
        {
          name = "woff2";
          text = "";
          fg = "#ececec";

        }
        {
          name = "wrl";
          text = "󰆧";
          fg = "#888888";

        }
        {
          name = "wrz";
          text = "󰆧";
          fg = "#888888";

        }
        {
          name = "x";
          text = "";
          fg = "#599eff";

        }
        {
          name = "xaml";
          text = "󰙳";
          fg = "#512bd4";

        }
        {
          name = "xcf";
          text = "";
          fg = "#635b46";

        }
        {
          name = "xcplayground";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "xcstrings";
          text = "";
          fg = "#2596be";

        }
        {
          name = "xls";
          text = "󰈛";
          fg = "#207245";

        }
        {
          name = "xlsx";
          text = "󰈛";
          fg = "#207245";

        }
        {
          name = "xm";
          text = "";
          fg = "#519aba";

        }
        {
          name = "xml";
          text = "󰗀";
          fg = "${colors.bright_orange}";

        }
        {
          name = "xpi";
          text = "";
          fg = "#ff1b01";

        }
        {
          name = "xul";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "xz";
          text = "";
          fg = "#eca517";

        }
        {
          name = "yaml";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "yml";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "zig";
          text = "";
          fg = "${colors.bright_orange}";

        }
        {
          name = "zip";
          text = "";
          fg = "${colors.bright_black}";

        }
        {
          name = "zsh";
          text = "";
          fg = "${colors.bright_green}";

        }
        {
          name = "zst";
          text = "";
          fg = "#eca517";

        }
      ];
      conds = [
        {
          "if" = "orphan";
          text = "";
        }
        {
          "if" = "link";
          text = "";
        }
        {
          "if" = "block";
          text = "";
        }
        {
          "if" = "char";
          text = "";
        }
        {
          "if" = "fifo";
          text = "";
        }
        {
          "if" = "sock";
          text = "";
        }
        {
          "if" = "sticky";
          text = "";
        }
        {
          "if" = "dummy";
          text = "";
        }
        {
          "if" = "dir";
          text = "󰉋";
        }
        {
          "if" = "exec";
          text = "";
        }
        {
          "if" = "!dir";
          text = "󰈔";
        }
      ];
    };
  };
}
