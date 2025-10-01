{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "Simone Tardiani";
    userEmail = "simone.tardiani.imp@gmail.com";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      pull.rebase = false;
      http.postBuffer = 524288000;
      url."git@github.com:".insteadOf = "https://github.com/";
      url."git@gitlab.com:".insteadOf = "https://gitlab.com/";
    };
  };

  programs.ssh = {
    enable = true;

    # Opt-out of legacy defaults
    enableDefaultConfig = false;

    # Define defaults yourself if you want them
    matchBlocks = {
      "*" = {
        forwardAgent = true;
        identityFile = "~/.ssh/id_ed25519";
      };

      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };

      "gitlab.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
