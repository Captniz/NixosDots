{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
  yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "main";
		hash = "sha256-235437cf3632a3cafe37ec1b22059e4b014a7aff";
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
      full-border = "${yazi-plugins}/full-border.yazi";
      git = "${yazi-plugins}/git.yazi";
      smart-filter = "${yazi-plugins}/smart-filter.yazi";
      
      glow = pkgs.fetchFromGitHub {
	  	  owner = "Reledia";
	  	  repo = "glow.yazi";
	  	  rev = "main";
        hash = "sha256-fKJ5ld5xc6HsM/h5j73GABB5i3nmcwWCs+QSdDPA9cU=";
      };
      hexyl = pkgs.fetchFromGitHub {
	  	  owner = "Reledia";
	  	  repo = "hexyl.yazi";
	  	  rev = "main";
        hash = "sha256-ccc0a4a959bea14dbe8f2b243793aacd697e34e2";
      };
    };
    settings = {
      plugin = {
        prepend_previewers = [
          { 
            name = "*.md"; 
            run = "glow"; 
          }
          { 
            name = "*"; 
            run = "hexyl"; 
          }
        ];
      };
    };
  };
}