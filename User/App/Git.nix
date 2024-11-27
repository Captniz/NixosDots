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
      credential.helper = "oauth";
      pull.rebase = false;
      http.postBuffer = 524288000;
    };
  };
}
