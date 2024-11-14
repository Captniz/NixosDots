{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
  yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "main";
		#hash = "sha256-235437cf3632a3cafe37ec1b22059e4b014a7aff";
  };

in
{
  #imports = [
  #  ../Themes/${userSettings.theme}/Rofi-override.nix
  #];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    plugins = {
      starship = pkgs.fetchFromGitHub {
	  	owner = "Reledia";
	  	repo = "glow.yazi";
	  	rev = "main";
	  };
    };


  };
}