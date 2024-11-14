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
      command = pkgs.fetchFromGitHub {
	  	  owner = "KKV9";
	  	  repo = "command.yazi";
	  	  rev = "main";
        hash = "sha256-nixvR8KhnidblEOWaOfww0BP4c9ZuQj/RS/GBCPLDQQ=";
      };
    };
    keymap = {
			manager.prepend_keymap = [
				{
					on = ["c" "p"];
					run = "plugin command";
					desc = "Yazi command promt";
				}
			];
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