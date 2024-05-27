{ config, lib, pkgs, ...}:

{
  programs.zathura = {
    enable = true;
    options = {
      adjust-open = "best-fit";
      pages-per-row = 1;
      scroll-page-aware = true;
      smooth-scroll = true;
      scroll-full-overlap = "0.01";
      scroll-step = 100;
      zoom-min = 10;
      guioptions = "s";

      # zathurarc-color
      #font = "Firacode Bold 10";
      #default-bg = "#FDF6E3";
      #default-fg = "#5C6A72";
      #statusbar-bg = "#FDF6E3";
      #statusbar-fg = "#93B259";
      #inputbar-bg = "#FDF6E3";
      #inputbar-fg = "#93B259";
      #notification-error-bg = "#FDF6E3";
      #notification-error-fg = "#F57D26";
      #notification-warning-bg = "#FDF6E3";
      #notification-warning-fg = "#E66868";
      #highlight-color ="#8DA101";
      #highlight-active-color ="#DFA000";
      #completion-highlight-bg = "#FDF6E3";
      #completion-highlight-fg = "#93B259";
      #completion-bg = "#FDF6E3";
      #completion-fg = "#93B259";
      #notification-bg = "#FDF6E3";
      #notification-fg = "#93B259";

      recolor = false;
      recolor-lightcolor = "#FDF6E3";
      recolor-darkcolor ="#5C6A72";
      recolor-reverse-video = true;
      recolor-keephue = true;

      render-loading= false;
    };
  };
}