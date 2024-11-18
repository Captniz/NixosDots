{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
in
{
    programs.yazi.theme  = lib.mkForce {
        flavor = {
            use = "";
        };

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
            tab_inactive = {};
            tab_width = 1;
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
            separator_open = "";
            separator_close = "";
            separator_style = {
                fg = "${colors.bg2}";
                bg = "${colors.bg2}";
            };
            mode_normal = {
                bg = "${colors.bright_blue}";
                bold = true;
            };
            mode_select = {
                bg = "${colors.red}";
                bold = true;
            };
            mode_unset = {
                bg = "${colors.red}";
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
            permissions_t = {
                fg = "${colors.green}";
            };
            permissions_r = {
                fg = "${colors.yellow}";
            };
            permissions_w = {
                fg = "${colors.red}";
            };
            permissions_x = {
                fg = "${colors.aqua}";
            };
            permissions_s = {
                fg = "${colors.bg0}";
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
            inactive = {};
        };
        input = {
            border = {
                fg = "${colors.bright_blue}";
            };
            title = {};
            value = {};
            selected = {
                reversed = true;
            };
        };
        confirm = {
            border = {
                fg = "${colors.bright_blue}";
            };
            title = {
                fg = "${colors.bright_blue}";
            };
            content = {};
            list = {};
            btn_yes = {
                reversed = true;
            };
            btn_no = {};
            btn_labels = ["  [Y]es  "
                "  (N)o  "
            ];
        };
        completion = {
            border = {
                fg = "${colors.bright_blue}";
            };
            active = {
                reversed = true;
            };
            inactive = {};
            icon_file = "";
            icon_folder = "";
            icon_command = "";
        };
        tasks = {
            border = {
                fg = "${colors.bright_blue}";
            };
            title = {};
            hovered = {
                fg = "${colors.purple}";
                underline = true;
            };
        };
        which = {
            cols = 3;
            mask = {
                bg = "black";
            };
            cand = {
                fg = "lightcyan";
            };
            rest = {
                fg = "${colors.bg0}";
            };
            desc = {
                fg = "${colors.bright_purple}";
            };
            separator = "  ";
            separator_style = {
                fg = "${colors.bg0}";
            };
        };
        help = {
            on = {
                fg = "${colors.aqua}";
            };
            run = {
                fg = "${colors.purple}";
            };
            desc = {};
            hovered = {
                reversed = true;
                bold = true;
            };
            footer = {
                fg = "${colors.black}";
                bg = "${colors.white}";
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
            rules = [{
                mime = "image/*";
                fg = "${colors.yellow}";
            } {
                mime = "{audio,video}/*";
                fg = "${colors.purple}";
            } {
                mime = "application/{,g}zip";
                fg = "${colors.red}";
            } {
                mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}";
                fg = "${colors.red}";
            } {
                mime = "application/{pdf,doc,rtf,vnd.*}";
                fg = "${colors.aqua}";
            } {
                name = "*";
                is = "orphan";
                bg = "${colors.red}";
            } {
                name = "*";
                is = "exec";
                underline = true;
            } {
                name = "*";
                is = "dummy";
                bg = "${colors.red}";
            } {
                name = "*/";
                is = "dummy";
                bg = "${colors.red}";
            } {
                name = "*/";
                fg = "${colors.bright_blue}";
            }];
        };
        icon = {
            globs = [];
            dirs = [{
                name = ".config";
                text = "";
            } {
                name = ".git";
                text = "";
            } {
                name = "Desktop";
                text = "";
            } {
                name = "Development";
                text = "";
            } {
                name = "Documents";
                text = "";
            } {
                name = "Downloads";
                text = "";
            } {
                name = "Library";
                text = "";
            } {
                name = "Movies";
                text = "";
            } {
                name = "Music";
                text = "";
            } {
                name = "Pictures";
                text = "";
            } {
                name = "Images";
                text = "";
            } {
                name = "Public";
                text = "";
            } {
                name = "Videos";
                text = "";
            }];
            files = [{
                name = ".babelrc";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = ".bash_profile";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = ".bashrc";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = ".dockerignore";
                text = "󰡨";
                fg_dark = "#458ee6";
                fg_light = "#2e5f99";
            } {
                name = ".ds_store";
                text = "";
                fg_dark = "#41535b";
                fg_light = "#41535b";
            } {
                name = ".editorconfig";
                text = "";
                fg_dark = "#fff2f2";
                fg_light = "#333030";
            } {
                name = ".env";
                text = "";
                fg_dark = "#faf743";
                fg_light = "#32310d";
            } {
                name = ".eslintignore";
                text = "";
                fg_dark = "#4b32c3";
                fg_light = "#4b32c3";
            } {
                name = ".eslintrc";
                text = "";
                fg_dark = "#4b32c3";
                fg_light = "#4b32c3";
            } {
                name = ".gitattributes";
                text = "";
                fg_dark = "#f54d27";
                fg_light = "#b83a1d";
            } {
                name = ".gitconfig";
                text = "";
                fg_dark = "#f54d27";
                fg_light = "#b83a1d";
            } {
                name = ".gitignore";
                text = "";
                fg_dark = "#f54d27";
                fg_light = "#b83a1d";
            } {
                name = ".gitlab-ci.yml";
                text = "";
                fg_dark = "#e24329";
                fg_light = "#aa321f";
            } {
                name = ".gitmodules";
                text = "";
                fg_dark = "#f54d27";
                fg_light = "#b83a1d";
            } {
                name = ".gtkrc-2.0";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = ".gvimrc";
                text = "";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = ".luaurc";
                text = "";
                fg_dark = "#00a2ff";
                fg_light = "#007abf";
            } {
                name = ".mailmap";
                text = "󰊢";
                fg_dark = "#41535b";
                fg_light = "#41535b";
            } {
                name = ".npmignore";
                text = "";
                fg_dark = "#e8274b";
                fg_light = "#ae1d38";
            } {
                name = ".npmrc";
                text = "";
                fg_dark = "#e8274b";
                fg_light = "#ae1d38";
            } {
                name = ".prettierrc";
                text = "";
                fg_dark = "#4285f4";
                fg_light = "#3264b7";
            } {
                name = ".settings.json";
                text = "";
                fg_dark = "#854cc7";
                fg_light = "#643995";
            } {
                name = ".SRCINFO";
                text = "󰣇";
                fg_dark = "#0f94d2";
                fg_light = "#0b6f9e";
            } {
                name = ".vimrc";
                text = "";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = ".Xauthority";
                text = "";
                fg_dark = "#e54d18";
                fg_light = "#ac3a12";
            } {
                name = ".xinitrc";
                text = "";
                fg_dark = "#e54d18";
                fg_light = "#ac3a12";
            } {
                name = ".Xresources";
                text = "";
                fg_dark = "#e54d18";
                fg_light = "#ac3a12";
            } {
                name = ".xsession";
                text = "";
                fg_dark = "#e54d18";
                fg_light = "#ac3a12";
            } {
                name = ".zprofile";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = ".zshenv";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = ".zshrc";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "_gvimrc";
                text = "";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "_vimrc";
                text = "";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "avif";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "brewfile";
                text = "";
                fg_dark = "#701516";
                fg_light = "#701516";
            } {
                name = "bspwmrc";
                text = "";
                fg_dark = "#2f2f2f";
                fg_light = "#2f2f2f";
            } {
                name = "build";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "build.gradle";
                text = "";
                fg_dark = "#005f87";
                fg_light = "#005f87";
            } {
                name = "build.zig.zon";
                text = "";
                fg_dark = "#f69a1b";
                fg_light = "#7b4d0e";
            } {
                name = "cantorrc";
                text = "";
                fg_dark = "#1c99f3";
                fg_light = "#1573b6";
            } {
                name = "checkhealth";
                text = "󰓙";
                fg_dark = "#75b4fb";
                fg_light = "#3a5a7e";
            } {
                name = "cmakelists.txt";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "commit_editmsg";
                text = "";
                fg_dark = "#f54d27";
                fg_light = "#b83a1d";
            } {
                name = "compose.yaml";
                text = "󰡨";
                fg_dark = "#458ee6";
                fg_light = "#2e5f99";
            } {
                name = "compose.yml";
                text = "󰡨";
                fg_dark = "#458ee6";
                fg_light = "#2e5f99";
            } {
                name = "config";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "containerfile";
                text = "󰡨";
                fg_dark = "#458ee6";
                fg_light = "#2e5f99";
            } {
                name = "copying";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "copying.lesser";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "docker-compose.yaml";
                text = "󰡨";
                fg_dark = "#458ee6";
                fg_light = "#2e5f99";
            } {
                name = "docker-compose.yml";
                text = "󰡨";
                fg_dark = "#458ee6";
                fg_light = "#2e5f99";
            } {
                name = "dockerfile";
                text = "󰡨";
                fg_dark = "#458ee6";
                fg_light = "#2e5f99";
            } {
                name = "ext_typoscript_setup.txt";
                text = "";
                fg_dark = "#ff8700";
                fg_light = "#aa5a00";
            } {
                name = "favicon.ico";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "fp-info-cache";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "fp-lib-table";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "FreeCAD.conf";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "gemfile$";
                text = "";
                fg_dark = "#701516";
                fg_light = "#701516";
            } {
                name = "gnumakefile";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "gradle-wrapper.properties";
                text = "";
                fg_dark = "#005f87";
                fg_light = "#005f87";
            } {
                name = "gradle.properties";
                text = "";
                fg_dark = "#005f87";
                fg_light = "#005f87";
            } {
                name = "gradlew";
                text = "";
                fg_dark = "#005f87";
                fg_light = "#005f87";
            } {
                name = "groovy";
                text = "";
                fg_dark = "#4a687c";
                fg_light = "#384e5d";
            } {
                name = "gruntfile.babel.js";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "gruntfile.coffee";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "gruntfile.js";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "gruntfile.ts";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "gtkrc";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "gulpfile.babel.js";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "gulpfile.coffee";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "gulpfile.js";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "gulpfile.ts";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "hyprland.conf";
                text = "";
                fg_dark = "#00aaae";
                fg_light = "#008082";
            } {
                name = "i3blocks.conf";
                text = "";
                fg_dark = "#e8ebee";
                fg_light = "#2e2f30";
            } {
                name = "i3status.conf";
                text = "";
                fg_dark = "#e8ebee";
                fg_light = "#2e2f30";
            } {
                name = "kalgebrarc";
                text = "";
                fg_dark = "#1c99f3";
                fg_light = "#1573b6";
            } {
                name = "kdeglobals";
                text = "";
                fg_dark = "#1c99f3";
                fg_light = "#1573b6";
            } {
                name = "kdenlive-layoutsrc";
                text = "";
                fg_dark = "#83b8f2";
                fg_light = "#425c79";
            } {
                name = "kdenliverc";
                text = "";
                fg_dark = "#83b8f2";
                fg_light = "#425c79";
            } {
                name = "kritadisplayrc";
                text = "";
                fg_dark = "#f245fb";
                fg_light = "#a12ea7";
            } {
                name = "kritarc";
                text = "";
                fg_dark = "#f245fb";
                fg_light = "#a12ea7";
            } {
                name = "license";
                text = "";
                fg_dark = "#d0bf41";
                fg_light = "#686020";
            } {
                name = "lxde-rc.xml";
                text = "";
                fg_dark = "#909090";
                fg_light = "#606060";
            } {
                name = "lxqt.conf";
                text = "";
                fg_dark = "#0192d3";
                fg_light = "#016e9e";
            } {
                name = "makefile";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "mix.lock";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "mpv.conf";
                text = "";
                fg_dark = "#3b1342";
                fg_light = "#3b1342";
            } {
                name = "node_modules";
                text = "";
                fg_dark = "#e8274b";
                fg_light = "#ae1d38";
            } {
                name = "package-lock.json";
                text = "";
                fg_dark = "#7a0d21";
                fg_light = "#7a0d21";
            } {
                name = "package.json";
                text = "";
                fg_dark = "#e8274b";
                fg_light = "#ae1d38";
            } {
                name = "PKGBUILD";
                text = "";
                fg_dark = "#0f94d2";
                fg_light = "#0b6f9e";
            } {
                name = "platformio.ini";
                text = "";
                fg_dark = "#f6822b";
                fg_light = "#a4571d";
            } {
                name = "pom.xml";
                text = "";
                fg_dark = "#7a0d21";
                fg_light = "#7a0d21";
            } {
                name = "procfile";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "PrusaSlicer.ini";
                text = "";
                fg_dark = "#ec6b23";
                fg_light = "#9d4717";
            } {
                name = "PrusaSlicerGcodeViewer.ini";
                text = "";
                fg_dark = "#ec6b23";
                fg_light = "#9d4717";
            } {
                name = "py.typed";
                text = "";
                fg_dark = "#ffbc03";
                fg_light = "#805e02";
            } {
                name = "QtProject.conf";
                text = "";
                fg_dark = "#40cd52";
                fg_light = "#2b8937";
            } {
                name = "R";
                text = "󰟔";
                fg_dark = "#2266ba";
                fg_light = "#1a4c8c";
            } {
                name = "r";
                text = "󰟔";
                fg_dark = "#2266ba";
                fg_light = "#1a4c8c";
            } {
                name = "rakefile";
                text = "";
                fg_dark = "#701516";
                fg_light = "#701516";
            } {
                name = "rmd";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "settings.gradle";
                text = "";
                fg_dark = "#005f87";
                fg_light = "#005f87";
            } {
                name = "svelte.config.js";
                text = "";
                fg_dark = "#ff3e00";
                fg_light = "#bf2e00";
            } {
                name = "sxhkdrc";
                text = "";
                fg_dark = "#2f2f2f";
                fg_light = "#2f2f2f";
            } {
                name = "sym-lib-table";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "tailwind.config.js";
                text = "󱏿";
                fg_dark = "#20c2e3";
                fg_light = "#158197";
            } {
                name = "tailwind.config.mjs";
                text = "󱏿";
                fg_dark = "#20c2e3";
                fg_light = "#158197";
            } {
                name = "tailwind.config.ts";
                text = "󱏿";
                fg_dark = "#20c2e3";
                fg_light = "#158197";
            } {
                name = "tmux.conf";
                text = "";
                fg_dark = "#14ba19";
                fg_light = "#0f8c13";
            } {
                name = "tmux.conf.local";
                text = "";
                fg_dark = "#14ba19";
                fg_light = "#0f8c13";
            } {
                name = "tsconfig.json";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "unlicense";
                text = "";
                fg_dark = "#d0bf41";
                fg_light = "#686020";
            } {
                name = "vagrantfile$";
                text = "";
                fg_dark = "#1563ff";
                fg_light = "#104abf";
            } {
                name = "vlcrc";
                text = "󰕼";
                fg_dark = "#ee7a00";
                fg_light = "#9f5100";
            } {
                name = "webpack";
                text = "󰜫";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "weston.ini";
                text = "";
                fg_dark = "#ffbb01";
                fg_light = "#805e00";
            } {
                name = "workspace";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "xmobarrc";
                text = "";
                fg_dark = "#fd4d5d";
                fg_light = "#a9333e";
            } {
                name = "xmobarrc.hs";
                text = "";
                fg_dark = "#fd4d5d";
                fg_light = "#a9333e";
            } {
                name = "xmonad.hs";
                text = "";
                fg_dark = "#fd4d5d";
                fg_light = "#a9333e";
            } {
                name = "xorg.conf";
                text = "";
                fg_dark = "#e54d18";
                fg_light = "#ac3a12";
            } {
                name = "xsettingsd.conf";
                text = "";
                fg_dark = "#e54d18";
                fg_light = "#ac3a12";
            }];
            exts = [{
                name = "3gp";
                text = "";
                fg_dark = "#fd971f";
                fg_light = "#7e4c10";
            } {
                name = "3mf";
                text = "󰆧";
                fg_dark = "#888888";
                fg_light = "#5b5b5b";
            } {
                name = "7z";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "a";
                text = "";
                fg_dark = "#dcddd6";
                fg_light = "#494a47";
            } {
                name = "aac";
                text = "";
                fg_dark = "#00afff";
                fg_light = "#0075aa";
            } {
                name = "ai";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "aif";
                text = "";
                fg_dark = "#00afff";
                fg_light = "#0075aa";
            } {
                name = "aiff";
                text = "";
                fg_dark = "#00afff";
                fg_light = "#0075aa";
            } {
                name = "android";
                text = "";
                fg_dark = "#34a853";
                fg_light = "#277e3e";
            } {
                name = "ape";
                text = "";
                fg_dark = "#00afff";
                fg_light = "#0075aa";
            } {
                name = "apk";
                text = "";
                fg_dark = "#34a853";
                fg_light = "#277e3e";
            } {
                name = "app";
                text = "";
                fg_dark = "#9f0500";
                fg_light = "#9f0500";
            } {
                name = "applescript";
                text = "";
                fg_dark = "#6d8085";
                fg_light = "#526064";
            } {
                name = "asc";
                text = "󰦝";
                fg_dark = "#576d7f";
                fg_light = "#41525f";
            } {
                name = "ass";
                text = "󰨖";
                fg_dark = "#ffb713";
                fg_light = "#805c0a";
            } {
                name = "astro";
                text = "";
                fg_dark = "#e23f67";
                fg_light = "#aa2f4d";
            } {
                name = "awk";
                text = "";
                fg_dark = "#4d5a5e";
                fg_light = "#3a4446";
            } {
                name = "azcli";
                text = "";
                fg_dark = "#0078d4";
                fg_light = "#005a9f";
            } {
                name = "bak";
                text = "󰁯";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "bash";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "bat";
                text = "";
                fg_dark = "#c1f12e";
                fg_light = "#40500f";
            } {
                name = "bazel";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "bib";
                text = "󱉟";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "bicep";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "bicepparam";
                text = "";
                fg_dark = "#9f74b3";
                fg_light = "#6a4d77";
            } {
                name = "bin";
                text = "";
                fg_dark = "#9f0500";
                fg_light = "#9f0500";
            } {
                name = "blade.php";
                text = "";
                fg_dark = "#f05340";
                fg_light = "#a0372b";
            } {
                name = "blend";
                text = "󰂫";
                fg_dark = "#ea7600";
                fg_light = "#9c4f00";
            } {
                name = "blp";
                text = "󰺾";
                fg_dark = "#5796e2";
                fg_light = "#3a6497";
            } {
                name = "bmp";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "brep";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "bz";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "bz2";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "bz3";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "bzl";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "c";
                text = "";
                fg_dark = "#599eff";
                fg_light = "#3b69aa";
            } {
                name = "c++";
                text = "";
                fg_dark = "#f34b7d";
                fg_light = "#a23253";
            } {
                name = "cache";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "cast";
                text = "";
                fg_dark = "#fd971f";
                fg_light = "#7e4c10";
            } {
                name = "cbl";
                text = "⚙";
                fg_dark = "#005ca5";
                fg_light = "#005ca5";
            } {
                name = "cc";
                text = "";
                fg_dark = "#f34b7d";
                fg_light = "#a23253";
            } {
                name = "ccm";
                text = "";
                fg_dark = "#f34b7d";
                fg_light = "#a23253";
            } {
                name = "cfg";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "cjs";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "clj";
                text = "";
                fg_dark = "#8dc149";
                fg_light = "#466024";
            } {
                name = "cljc";
                text = "";
                fg_dark = "#8dc149";
                fg_light = "#466024";
            } {
                name = "cljd";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "cljs";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "cmake";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "cob";
                text = "⚙";
                fg_dark = "#005ca5";
                fg_light = "#005ca5";
            } {
                name = "cobol";
                text = "⚙";
                fg_dark = "#005ca5";
                fg_light = "#005ca5";
            } {
                name = "coffee";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "conf";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "config.ru";
                text = "";
                fg_dark = "#701516";
                fg_light = "#701516";
            } {
                name = "cp";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "cpp";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "cppm";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "cpy";
                text = "⚙";
                fg_dark = "#005ca5";
                fg_light = "#005ca5";
            } {
                name = "cr";
                text = "";
                fg_dark = "#c8c8c8";
                fg_light = "#434343";
            } {
                name = "crdownload";
                text = "";
                fg_dark = "#44cda8";
                fg_light = "#226654";
            } {
                name = "cs";
                text = "󰌛";
                fg_dark = "#596706";
                fg_light = "#434d04";
            } {
                name = "csh";
                text = "";
                fg_dark = "#4d5a5e";
                fg_light = "#3a4446";
            } {
                name = "cshtml";
                text = "󱦗";
                fg_dark = "#512bd4";
                fg_light = "#512bd4";
            } {
                name = "cson";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "csproj";
                text = "󰪮";
                fg_dark = "#512bd4";
                fg_light = "#512bd4";
            } {
                name = "css";
                text = "";
                fg_dark = "#42a5f5";
                fg_light = "#2c6ea3";
            } {
                name = "csv";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "cts";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "cu";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "cue";
                text = "󰲹";
                fg_dark = "#ed95ae";
                fg_light = "#764a57";
            } {
                name = "cuh";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "cxx";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "cxxm";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "d";
                text = "";
                fg_dark = "#427819";
                fg_light = "#325a13";
            } {
                name = "d.ts";
                text = "";
                fg_dark = "#d59855";
                fg_light = "#6a4c2a";
            } {
                name = "dart";
                text = "";
                fg_dark = "#03589c";
                fg_light = "#03589c";
            } {
                name = "db";
                text = "";
                fg_dark = "#dad8d8";
                fg_light = "#494848";
            } {
                name = "dconf";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "desktop";
                text = "";
                fg_dark = "#563d7c";
                fg_light = "#563d7c";
            } {
                name = "diff";
                text = "";
                fg_dark = "#41535b";
                fg_light = "#41535b";
            } {
                name = "dll";
                text = "";
                fg_dark = "#4d2c0b";
                fg_light = "#4d2c0b";
            } {
                name = "doc";
                text = "󰈬";
                fg_dark = "#185abd";
                fg_light = "#185abd";
            } {
                name = "Dockerfile";
                text = "󰡨";
                fg_dark = "#458ee6";
                fg_light = "#2e5f99";
            } {
                name = "docx";
                text = "󰈬";
                fg_dark = "#185abd";
                fg_light = "#185abd";
            } {
                name = "dot";
                text = "󱁉";
                fg_dark = "#30638e";
                fg_light = "#244a6a";
            } {
                name = "download";
                text = "";
                fg_dark = "#44cda8";
                fg_light = "#226654";
            } {
                name = "drl";
                text = "";
                fg_dark = "#ffafaf";
                fg_light = "#553a3a";
            } {
                name = "dropbox";
                text = "";
                fg_dark = "#0061fe";
                fg_light = "#0049be";
            } {
                name = "dump";
                text = "";
                fg_dark = "#dad8d8";
                fg_light = "#494848";
            } {
                name = "dwg";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "dxf";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "ebook";
                text = "";
                fg_dark = "#eab16d";
                fg_light = "#755836";
            } {
                name = "edn";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "eex";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "ejs";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "el";
                text = "";
                fg_dark = "#8172be";
                fg_light = "#61568e";
            } {
                name = "elc";
                text = "";
                fg_dark = "#8172be";
                fg_light = "#61568e";
            } {
                name = "elf";
                text = "";
                fg_dark = "#9f0500";
                fg_light = "#9f0500";
            } {
                name = "elm";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "eln";
                text = "";
                fg_dark = "#8172be";
                fg_light = "#61568e";
            } {
                name = "env";
                text = "";
                fg_dark = "#faf743";
                fg_light = "#32310d";
            } {
                name = "eot";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "epp";
                text = "";
                fg_dark = "#ffa61a";
                fg_light = "#80530d";
            } {
                name = "epub";
                text = "";
                fg_dark = "#eab16d";
                fg_light = "#755836";
            } {
                name = "erb";
                text = "";
                fg_dark = "#701516";
                fg_light = "#701516";
            } {
                name = "erl";
                text = "";
                fg_dark = "#b83998";
                fg_light = "#8a2b72";
            } {
                name = "ex";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "exe";
                text = "";
                fg_dark = "#9f0500";
                fg_light = "#9f0500";
            } {
                name = "exs";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "f#";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "f3d";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "f90";
                text = "󱈚";
                fg_dark = "#734f96";
                fg_light = "#563b70";
            } {
                name = "fbx";
                text = "󰆧";
                fg_dark = "#888888";
                fg_light = "#5b5b5b";
            } {
                name = "fcbak";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fcmacro";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fcmat";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fcparam";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fcscript";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fcstd";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fcstd1";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fctb";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fctl";
                text = "";
                fg_dark = "#cb0d0d";
                fg_light = "#cb0d0d";
            } {
                name = "fdmdownload";
                text = "";
                fg_dark = "#44cda8";
                fg_light = "#226654";
            } {
                name = "fish";
                text = "";
                fg_dark = "#4d5a5e";
                fg_light = "#3a4446";
            } {
                name = "flac";
                text = "";
                fg_dark = "#0075aa";
                fg_light = "#005880";
            } {
                name = "flc";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "flf";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "fnl";
                text = "";
                fg_dark = "#fff3d7";
                fg_light = "#33312b";
            } {
                name = "fs";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "fsi";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "fsscript";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "fsx";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "gcode";
                text = "󰐫";
                fg_dark = "#1471ad";
                fg_light = "#0f5582";
            } {
                name = "gd";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "gemspec";
                text = "";
                fg_dark = "#701516";
                fg_light = "#701516";
            } {
                name = "gif";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "git";
                text = "";
                fg_dark = "#f14c28";
                fg_light = "#b5391e";
            } {
                name = "glb";
                text = "";
                fg_dark = "#ffb13b";
                fg_light = "#80581e";
            } {
                name = "gnumakefile";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "go";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "godot";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "gql";
                text = "";
                fg_dark = "#e535ab";
                fg_light = "#ac2880";
            } {
                name = "graphql";
                text = "";
                fg_dark = "#e535ab";
                fg_light = "#ac2880";
            } {
                name = "gresource";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "gv";
                text = "󱁉";
                fg_dark = "#30638e";
                fg_light = "#244a6a";
            } {
                name = "gz";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "h";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "haml";
                text = "";
                fg_dark = "#eaeae1";
                fg_light = "#2f2f2d";
            } {
                name = "hbs";
                text = "";
                fg_dark = "#f0772b";
                fg_light = "#a04f1d";
            } {
                name = "heex";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "hex";
                text = "";
                fg_dark = "#2e63ff";
                fg_light = "#224abf";
            } {
                name = "hh";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "hpp";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "hrl";
                text = "";
                fg_dark = "#b83998";
                fg_light = "#8a2b72";
            } {
                name = "hs";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "htm";
                text = "";
                fg_dark = "#e34c26";
                fg_light = "#aa391c";
            } {
                name = "html";
                text = "";
                fg_dark = "#e44d26";
                fg_light = "#ab3a1c";
            } {
                name = "huff";
                text = "󰡘";
                fg_dark = "#4242c7";
                fg_light = "#4242c7";
            } {
                name = "hurl";
                text = "";
                fg_dark = "#ff0288";
                fg_light = "#bf0266";
            } {
                name = "hx";
                text = "";
                fg_dark = "#ea8220";
                fg_light = "#9c5715";
            } {
                name = "hxx";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "ical";
                text = "";
                fg_dark = "#2b2e83";
                fg_light = "#2b2e83";
            } {
                name = "icalendar";
                text = "";
                fg_dark = "#2b2e83";
                fg_light = "#2b2e83";
            } {
                name = "ico";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "ics";
                text = "";
                fg_dark = "#2b2e83";
                fg_light = "#2b2e83";
            } {
                name = "ifb";
                text = "";
                fg_dark = "#2b2e83";
                fg_light = "#2b2e83";
            } {
                name = "ifc";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "ige";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "iges";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "igs";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "image";
                text = "";
                fg_dark = "#d0bec8";
                fg_light = "#453f43";
            } {
                name = "img";
                text = "";
                fg_dark = "#d0bec8";
                fg_light = "#453f43";
            } {
                name = "import";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "info";
                text = "";
                fg_dark = "#ffffcd";
                fg_light = "#333329";
            } {
                name = "ini";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "ino";
                text = "";
                fg_dark = "#56b6c2";
                fg_light = "#397981";
            } {
                name = "ipynb";
                text = "";
                fg_dark = "#51a0cf";
                fg_light = "#366b8a";
            } {
                name = "iso";
                text = "";
                fg_dark = "#d0bec8";
                fg_light = "#453f43";
            } {
                name = "ixx";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "java";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "jl";
                text = "";
                fg_dark = "#a270ba";
                fg_light = "#6c4b7c";
            } {
                name = "jpeg";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "jpg";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "js";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "json";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "json5";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "jsonc";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "jsx";
                text = "";
                fg_dark = "#20c2e3";
                fg_light = "#158197";
            } {
                name = "jwmrc";
                text = "";
                fg_dark = "#0078cd";
                fg_light = "#005a9a";
            } {
                name = "jxl";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "kbx";
                text = "󰯄";
                fg_dark = "#737672";
                fg_light = "#565856";
            } {
                name = "kdb";
                text = "";
                fg_dark = "#529b34";
                fg_light = "#3e7427";
            } {
                name = "kdbx";
                text = "";
                fg_dark = "#529b34";
                fg_light = "#3e7427";
            } {
                name = "kdenlive";
                text = "";
                fg_dark = "#83b8f2";
                fg_light = "#425c79";
            } {
                name = "kdenlivetitle";
                text = "";
                fg_dark = "#83b8f2";
                fg_light = "#425c79";
            } {
                name = "kicad_dru";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "kicad_mod";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "kicad_pcb";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "kicad_prl";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "kicad_pro";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "kicad_sch";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "kicad_sym";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "kicad_wks";
                text = "";
                fg_dark = "#ffffff";
                fg_light = "#333333";
            } {
                name = "ko";
                text = "";
                fg_dark = "#dcddd6";
                fg_light = "#494a47";
            } {
                name = "kpp";
                text = "";
                fg_dark = "#f245fb";
                fg_light = "#a12ea7";
            } {
                name = "kra";
                text = "";
                fg_dark = "#f245fb";
                fg_light = "#a12ea7";
            } {
                name = "krz";
                text = "";
                fg_dark = "#f245fb";
                fg_light = "#a12ea7";
            } {
                name = "ksh";
                text = "";
                fg_dark = "#4d5a5e";
                fg_light = "#3a4446";
            } {
                name = "kt";
                text = "";
                fg_dark = "#7f52ff";
                fg_light = "#5f3ebf";
            } {
                name = "kts";
                text = "";
                fg_dark = "#7f52ff";
                fg_light = "#5f3ebf";
            } {
                name = "lck";
                text = "";
                fg_dark = "#bbbbbb";
                fg_light = "#5e5e5e";
            } {
                name = "leex";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "less";
                text = "";
                fg_dark = "#563d7c";
                fg_light = "#563d7c";
            } {
                name = "lff";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "lhs";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "lib";
                text = "";
                fg_dark = "#4d2c0b";
                fg_light = "#4d2c0b";
            } {
                name = "license";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "liquid";
                text = "";
                fg_dark = "#95bf47";
                fg_light = "#4a6024";
            } {
                name = "lock";
                text = "";
                fg_dark = "#bbbbbb";
                fg_light = "#5e5e5e";
            } {
                name = "log";
                text = "󰌱";
                fg_dark = "#dddddd";
                fg_light = "#4a4a4a";
            } {
                name = "lrc";
                text = "󰨖";
                fg_dark = "#ffb713";
                fg_light = "#805c0a";
            } {
                name = "lua";
                text = "";
                fg_dark = "#51a0cf";
                fg_light = "#366b8a";
            } {
                name = "luac";
                text = "";
                fg_dark = "#51a0cf";
                fg_light = "#366b8a";
            } {
                name = "luau";
                text = "";
                fg_dark = "#00a2ff";
                fg_light = "#007abf";
            } {
                name = "m";
                text = "";
                fg_dark = "#599eff";
                fg_light = "#3b69aa";
            } {
                name = "m3u";
                text = "󰲹";
                fg_dark = "#ed95ae";
                fg_light = "#764a57";
            } {
                name = "m3u8";
                text = "󰲹";
                fg_dark = "#ed95ae";
                fg_light = "#764a57";
            } {
                name = "m4a";
                text = "";
                fg_dark = "#00afff";
                fg_light = "#0075aa";
            } {
                name = "m4v";
                text = "";
                fg_dark = "#fd971f";
                fg_light = "#7e4c10";
            } {
                name = "magnet";
                text = "";
                fg_dark = "#a51b16";
                fg_light = "#a51b16";
            } {
                name = "makefile";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "markdown";
                text = "";
                fg_dark = "#dddddd";
                fg_light = "#4a4a4a";
            } {
                name = "material";
                text = "󰔉";
                fg_dark = "#b83998";
                fg_light = "#8a2b72";
            } {
                name = "md";
                text = "";
                fg_dark = "#dddddd";
                fg_light = "#4a4a4a";
            } {
                name = "md5";
                text = "󰕥";
                fg_dark = "#8c86af";
                fg_light = "#5d5975";
            } {
                name = "mdx";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "mint";
                text = "󰌪";
                fg_dark = "#87c095";
                fg_light = "#44604a";
            } {
                name = "mjs";
                text = "";
                fg_dark = "#f1e05a";
                fg_light = "#504b1e";
            } {
                name = "mk";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "mkv";
                text = "";
                fg_dark = "#fd971f";
                fg_light = "#7e4c10";
            } {
                name = "ml";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "mli";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "mm";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "mo";
                text = "∞";
                fg_dark = "#9772fb";
                fg_light = "#654ca7";
            } {
                name = "mobi";
                text = "";
                fg_dark = "#eab16d";
                fg_light = "#755836";
            } {
                name = "mov";
                text = "";
                fg_dark = "#fd971f";
                fg_light = "#7e4c10";
            } {
                name = "mp3";
                text = "";
                fg_dark = "#00afff";
                fg_light = "#0075aa";
            } {
                name = "mp4";
                text = "";
                fg_dark = "#fd971f";
                fg_light = "#7e4c10";
            } {
                name = "mpp";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "msf";
                text = "";
                fg_dark = "#137be1";
                fg_light = "#0e5ca9";
            } {
                name = "mts";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "mustache";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "nfo";
                text = "";
                fg_dark = "#ffffcd";
                fg_light = "#333329";
            } {
                name = "nim";
                text = "";
                fg_dark = "#f3d400";
                fg_light = "#514700";
            } {
                name = "nix";
                text = "";
                fg_dark = "#7ebae4";
                fg_light = "#3f5d72";
            } {
                name = "nswag";
                text = "";
                fg_dark = "#85ea2d";
                fg_light = "#427516";
            } {
                name = "nu";
                text = ">";
                fg_dark = "#3aa675";
                fg_light = "#276f4e";
            } {
                name = "o";
                text = "";
                fg_dark = "#9f0500";
                fg_light = "#9f0500";
            } {
                name = "obj";
                text = "󰆧";
                fg_dark = "#888888";
                fg_light = "#5b5b5b";
            } {
                name = "ogg";
                text = "";
                fg_dark = "#0075aa";
                fg_light = "#005880";
            } {
                name = "opus";
                text = "";
                fg_dark = "#0075aa";
                fg_light = "#005880";
            } {
                name = "org";
                text = "";
                fg_dark = "#77aa99";
                fg_light = "#4f7166";
            } {
                name = "otf";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "out";
                text = "";
                fg_dark = "#9f0500";
                fg_light = "#9f0500";
            } {
                name = "part";
                text = "";
                fg_dark = "#44cda8";
                fg_light = "#226654";
            } {
                name = "patch";
                text = "";
                fg_dark = "#41535b";
                fg_light = "#41535b";
            } {
                name = "pck";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "pcm";
                text = "";
                fg_dark = "#0075aa";
                fg_light = "#005880";
            } {
                name = "pdf";
                text = "";
                fg_dark = "#b30b00";
                fg_light = "#b30b00";
            } {
                name = "php";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "pl";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "pls";
                text = "󰲹";
                fg_dark = "#ed95ae";
                fg_light = "#764a57";
            } {
                name = "ply";
                text = "󰆧";
                fg_dark = "#888888";
                fg_light = "#5b5b5b";
            } {
                name = "pm";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "png";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "po";
                text = "";
                fg_dark = "#2596be";
                fg_light = "#1c708e";
            } {
                name = "pot";
                text = "";
                fg_dark = "#2596be";
                fg_light = "#1c708e";
            } {
                name = "pp";
                text = "";
                fg_dark = "#ffa61a";
                fg_light = "#80530d";
            } {
                name = "ppt";
                text = "󰈧";
                fg_dark = "#cb4a32";
                fg_light = "#983826";
            } {
                name = "prisma";
                text = "";
                fg_dark = "#5a67d8";
                fg_light = "#444da2";
            } {
                name = "pro";
                text = "";
                fg_dark = "#e4b854";
                fg_light = "#725c2a";
            } {
                name = "ps1";
                text = "󰨊";
                fg_dark = "#4273ca";
                fg_light = "#325698";
            } {
                name = "psb";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "psd";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "psd1";
                text = "󰨊";
                fg_dark = "#6975c4";
                fg_light = "#4f5893";
            } {
                name = "psm1";
                text = "󰨊";
                fg_dark = "#6975c4";
                fg_light = "#4f5893";
            } {
                name = "pub";
                text = "󰷖";
                fg_dark = "#e3c58e";
                fg_light = "#4c422f";
            } {
                name = "pxd";
                text = "";
                fg_dark = "#5aa7e4";
                fg_light = "#3c6f98";
            } {
                name = "pxi";
                text = "";
                fg_dark = "#5aa7e4";
                fg_light = "#3c6f98";
            } {
                name = "py";
                text = "";
                fg_dark = "#ffbc03";
                fg_light = "#805e02";
            } {
                name = "pyc";
                text = "";
                fg_dark = "#ffe291";
                fg_light = "#332d1d";
            } {
                name = "pyd";
                text = "";
                fg_dark = "#ffe291";
                fg_light = "#332d1d";
            } {
                name = "pyi";
                text = "";
                fg_dark = "#ffbc03";
                fg_light = "#805e02";
            } {
                name = "pyo";
                text = "";
                fg_dark = "#ffe291";
                fg_light = "#332d1d";
            } {
                name = "pyx";
                text = "";
                fg_dark = "#5aa7e4";
                fg_light = "#3c6f98";
            } {
                name = "qm";
                text = "";
                fg_dark = "#2596be";
                fg_light = "#1c708e";
            } {
                name = "qml";
                text = "";
                fg_dark = "#40cd52";
                fg_light = "#2b8937";
            } {
                name = "qrc";
                text = "";
                fg_dark = "#40cd52";
                fg_light = "#2b8937";
            } {
                name = "qss";
                text = "";
                fg_dark = "#40cd52";
                fg_light = "#2b8937";
            } {
                name = "query";
                text = "";
                fg_dark = "#90a850";
                fg_light = "#607035";
            } {
                name = "r";
                text = "󰟔";
                fg_dark = "#2266ba";
                fg_light = "#1a4c8c";
            } {
                name = "rake";
                text = "";
                fg_dark = "#701516";
                fg_light = "#701516";
            } {
                name = "rar";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "razor";
                text = "󱦘";
                fg_dark = "#512bd4";
                fg_light = "#512bd4";
            } {
                name = "rb";
                text = "";
                fg_dark = "#701516";
                fg_light = "#701516";
            } {
                name = "res";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "resi";
                text = "";
                fg_dark = "#f55385";
                fg_light = "#a33759";
            } {
                name = "rlib";
                text = "";
                fg_dark = "#dea584";
                fg_light = "#6f5242";
            } {
                name = "rmd";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "rproj";
                text = "󰗆";
                fg_dark = "#358a5b";
                fg_light = "#286844";
            } {
                name = "rs";
                text = "";
                fg_dark = "#dea584";
                fg_light = "#6f5242";
            } {
                name = "rss";
                text = "";
                fg_dark = "#fb9d3b";
                fg_light = "#7e4e1e";
            } {
                name = "sass";
                text = "";
                fg_dark = "#f55385";
                fg_light = "#a33759";
            } {
                name = "sbt";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "sc";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "scad";
                text = "";
                fg_dark = "#f9d72c";
                fg_light = "#53480f";
            } {
                name = "scala";
                text = "";
                fg_dark = "#cc3e44";
                fg_light = "#992e33";
            } {
                name = "scm";
                text = "󰘧";
                fg_dark = "#eeeeee";
                fg_light = "#303030";
            } {
                name = "scss";
                text = "";
                fg_dark = "#f55385";
                fg_light = "#a33759";
            } {
                name = "sh";
                text = "";
                fg_dark = "#4d5a5e";
                fg_light = "#3a4446";
            } {
                name = "sha1";
                text = "󰕥";
                fg_dark = "#8c86af";
                fg_light = "#5d5975";
            } {
                name = "sha224";
                text = "󰕥";
                fg_dark = "#8c86af";
                fg_light = "#5d5975";
            } {
                name = "sha256";
                text = "󰕥";
                fg_dark = "#8c86af";
                fg_light = "#5d5975";
            } {
                name = "sha384";
                text = "󰕥";
                fg_dark = "#8c86af";
                fg_light = "#5d5975";
            } {
                name = "sha512";
                text = "󰕥";
                fg_dark = "#8c86af";
                fg_light = "#5d5975";
            } {
                name = "sig";
                text = "λ";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "signature";
                text = "λ";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "skp";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "sldasm";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "sldprt";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "slim";
                text = "";
                fg_dark = "#e34c26";
                fg_light = "#aa391c";
            } {
                name = "sln";
                text = "";
                fg_dark = "#854cc7";
                fg_light = "#643995";
            } {
                name = "slvs";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "sml";
                text = "λ";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "so";
                text = "";
                fg_dark = "#dcddd6";
                fg_light = "#494a47";
            } {
                name = "sol";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "spec.js";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "spec.jsx";
                text = "";
                fg_dark = "#20c2e3";
                fg_light = "#158197";
            } {
                name = "spec.ts";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "spec.tsx";
                text = "";
                fg_dark = "#1354bf";
                fg_light = "#1354bf";
            } {
                name = "sql";
                text = "";
                fg_dark = "#dad8d8";
                fg_light = "#494848";
            } {
                name = "sqlite";
                text = "";
                fg_dark = "#dad8d8";
                fg_light = "#494848";
            } {
                name = "sqlite3";
                text = "";
                fg_dark = "#dad8d8";
                fg_light = "#494848";
            } {
                name = "srt";
                text = "󰨖";
                fg_dark = "#ffb713";
                fg_light = "#805c0a";
            } {
                name = "ssa";
                text = "󰨖";
                fg_dark = "#ffb713";
                fg_light = "#805c0a";
            } {
                name = "ste";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "step";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "stl";
                text = "󰆧";
                fg_dark = "#888888";
                fg_light = "#5b5b5b";
            } {
                name = "stp";
                text = "󰻫";
                fg_dark = "#839463";
                fg_light = "#576342";
            } {
                name = "strings";
                text = "";
                fg_dark = "#2596be";
                fg_light = "#1c708e";
            } {
                name = "styl";
                text = "";
                fg_dark = "#8dc149";
                fg_light = "#466024";
            } {
                name = "sub";
                text = "󰨖";
                fg_dark = "#ffb713";
                fg_light = "#805c0a";
            } {
                name = "sublime";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "suo";
                text = "";
                fg_dark = "#854cc7";
                fg_light = "#643995";
            } {
                name = "sv";
                text = "󰍛";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "svelte";
                text = "";
                fg_dark = "#ff3e00";
                fg_light = "#bf2e00";
            } {
                name = "svg";
                text = "󰜡";
                fg_dark = "#ffb13b";
                fg_light = "#80581e";
            } {
                name = "svh";
                text = "󰍛";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "swift";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "t";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "tbc";
                text = "󰛓";
                fg_dark = "#1e5cb3";
                fg_light = "#1e5cb3";
            } {
                name = "tcl";
                text = "󰛓";
                fg_dark = "#1e5cb3";
                fg_light = "#1e5cb3";
            } {
                name = "templ";
                text = "";
                fg_dark = "#dbbd30";
                fg_light = "#6e5e18";
            } {
                name = "terminal";
                text = "";
                fg_dark = "#31b53e";
                fg_light = "#217929";
            } {
                name = "test.js";
                text = "";
                fg_dark = "#cbcb41";
                fg_light = "#666620";
            } {
                name = "test.jsx";
                text = "";
                fg_dark = "#20c2e3";
                fg_light = "#158197";
            } {
                name = "test.ts";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "test.tsx";
                text = "";
                fg_dark = "#1354bf";
                fg_light = "#1354bf";
            } {
                name = "tex";
                text = "";
                fg_dark = "#3d6117";
                fg_light = "#3d6117";
            } {
                name = "tf";
                text = "";
                fg_dark = "#5f43e9";
                fg_light = "#4732af";
            } {
                name = "tfvars";
                text = "";
                fg_dark = "#5f43e9";
                fg_light = "#4732af";
            } {
                name = "tgz";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "tmux";
                text = "";
                fg_dark = "#14ba19";
                fg_light = "#0f8c13";
            } {
                name = "toml";
                text = "";
                fg_dark = "#9c4221";
                fg_light = "#753219";
            } {
                name = "torrent";
                text = "";
                fg_dark = "#44cda8";
                fg_light = "#226654";
            } {
                name = "tres";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "ts";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "tscn";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "tsconfig";
                text = "";
                fg_dark = "#ff8700";
                fg_light = "#aa5a00";
            } {
                name = "tsx";
                text = "";
                fg_dark = "#1354bf";
                fg_light = "#1354bf";
            } {
                name = "ttf";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "twig";
                text = "";
                fg_dark = "#8dc149";
                fg_light = "#466024";
            } {
                name = "txt";
                text = "󰈙";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "txz";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "typoscript";
                text = "";
                fg_dark = "#ff8700";
                fg_light = "#aa5a00";
            } {
                name = "ui";
                text = "";
                fg_dark = "#0c306e";
                fg_light = "#0c306e";
            } {
                name = "v";
                text = "󰍛";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "vala";
                text = "";
                fg_dark = "#7239b3";
                fg_light = "#562b86";
            } {
                name = "vh";
                text = "󰍛";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "vhd";
                text = "󰍛";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "vhdl";
                text = "󰍛";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "vim";
                text = "";
                fg_dark = "#019833";
                fg_light = "#017226";
            } {
                name = "vsh";
                text = "";
                fg_dark = "#5d87bf";
                fg_light = "#3e5a7f";
            } {
                name = "vsix";
                text = "";
                fg_dark = "#854cc7";
                fg_light = "#643995";
            } {
                name = "vue";
                text = "";
                fg_dark = "#8dc149";
                fg_light = "#466024";
            } {
                name = "wasm";
                text = "";
                fg_dark = "#5c4cdb";
                fg_light = "#4539a4";
            } {
                name = "wav";
                text = "";
                fg_dark = "#00afff";
                fg_light = "#0075aa";
            } {
                name = "webm";
                text = "";
                fg_dark = "#fd971f";
                fg_light = "#7e4c10";
            } {
                name = "webmanifest";
                text = "";
                fg_dark = "#f1e05a";
                fg_light = "#504b1e";
            } {
                name = "webp";
                text = "";
                fg_dark = "#a074c4";
                fg_light = "#6b4d83";
            } {
                name = "webpack";
                text = "󰜫";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "wma";
                text = "";
                fg_dark = "#00afff";
                fg_light = "#0075aa";
            } {
                name = "woff";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "woff2";
                text = "";
                fg_dark = "#ececec";
                fg_light = "#2f2f2f";
            } {
                name = "wrl";
                text = "󰆧";
                fg_dark = "#888888";
                fg_light = "#5b5b5b";
            } {
                name = "wrz";
                text = "󰆧";
                fg_dark = "#888888";
                fg_light = "#5b5b5b";
            } {
                name = "x";
                text = "";
                fg_dark = "#599eff";
                fg_light = "#3b69aa";
            } {
                name = "xaml";
                text = "󰙳";
                fg_dark = "#512bd4";
                fg_light = "#512bd4";
            } {
                name = "xcf";
                text = "";
                fg_dark = "#635b46";
                fg_light = "#4a4434";
            } {
                name = "xcplayground";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "xcstrings";
                text = "";
                fg_dark = "#2596be";
                fg_light = "#1c708e";
            } {
                name = "xls";
                text = "󰈛";
                fg_dark = "#207245";
                fg_light = "#207245";
            } {
                name = "xlsx";
                text = "󰈛";
                fg_dark = "#207245";
                fg_light = "#207245";
            } {
                name = "xm";
                text = "";
                fg_dark = "#519aba";
                fg_light = "#36677c";
            } {
                name = "xml";
                text = "󰗀";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "xpi";
                text = "";
                fg_dark = "#ff1b01";
                fg_light = "#bf1401";
            } {
                name = "xul";
                text = "";
                fg_dark = "#e37933";
                fg_light = "#975122";
            } {
                name = "xz";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            } {
                name = "yaml";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "yml";
                text = "";
                fg_dark = "#6d8086";
                fg_light = "#526064";
            } {
                name = "zig";
                text = "";
                fg_dark = "#f69a1b";
                fg_light = "#7b4d0e";
            } {
                name = "zip";
                text = "";
                fg_dark = "#f69a1b";
                fg_light = "#7b4d0e";
            } {
                name = "zsh";
                text = "";
                fg_dark = "#89e051";
                fg_light = "#447028";
            } {
                name = "zst";
                text = "";
                fg_dark = "#eca517";
                fg_light = "#76520c";
            }];
            conds = [{
                "if" = "orphan";
                text = "";
            } {
                "if" = "link";
                text = "";
            } {
                "if" = "block";
                text = "";
            } {
                "if" = "char";
                text = "";
            } {
                "if" = "fifo";
                text = "";
            } {
                "if" = "sock";
                text = "";
            } {
                "if" = "sticky";
                text = "";
            } {
                "if" = "dummy";
                text = "";
            } {
                "if" = "dir";
                text = "󰉋";
            } {
                "if" = "exec";
                text = "";
            } {
                "if" = "!dir";
                text = "󰈔";
            }];
        };
    };
}