{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  services.printing = {
    enable = true;
    browsing = true;
    defaultShared = true;
    openFirewall = true;
    webInterface = true;
    logLevel = "debug";
    drivers = with pkgs; [
      epson-escpr
      epson-escpr2
      gutenprint
    ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
