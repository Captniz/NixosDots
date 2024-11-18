{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
  yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "main";
    hash = "sha256-LxWc0hFSj1cp9/aWmN2mmojcQnvFl3meZ96CIbTt2f0=";
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
        hash = "sha256-9rPJcgMYtSY5lYnFQp3bAhaOBdNUkBaN1uMrjen6Z8g=";
      };
    
    };
    
    settings = lib.importTOML ./yazi.toml;
  };
}