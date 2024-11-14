{ config, lib, pkgs, userSettings, ...}:

let
  colors = import ../Themes/${userSettings.theme}/Colors.nix;
  yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "main";
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
      command = pkgs.fetchFromGitHub {
	  	  owner = "KKV9";
	  	  repo = "command.yazi";
	  	  rev = "main";
        hash = "sha256-dc9b48381eb1478248cff09d068593f9d6bc6f1f";
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