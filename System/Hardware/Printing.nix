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
