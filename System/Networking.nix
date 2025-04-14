{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}:

{
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = true;

  # Enable networking
  
  #Uncomment to enable the port
  networking.firewall.allowedTCPPorts = [ 3000 ];
  networking.networkmanager.enable = true;
}
