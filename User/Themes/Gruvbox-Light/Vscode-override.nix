{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ./Colors.nix;
in
{
    programs.vscode.userSettings = {
      "workbench.colorTheme"= lib.mkForce "Gruvbox Light Hard";
      "material-icon-theme.folders.color"= lib.mkForce colors.blue;
    };
}