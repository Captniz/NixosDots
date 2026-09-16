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


  # Enable systemd-resolved to handle dynamic network DNS (Tailscale)
  services.resolved.enable = true;

  #Uncomment to enable the port
  networking.firewall.allowedTCPPorts = [
    3000
    8000
    5353
  ];

  services.tailscale = {
    enable = true;
    extraSetFlags = ["--accept-routes" "--accept-dns"];
    
    #authKeyFile = "/run/secrets/tailscale_key";
  };
  #networking.extraHosts =
  #''
  #  127.0.0.1 localhost
  #  ::1 localhost
  #  127.0.0.2 YOUR_HOSTNAME
  #'';
  networking.networkmanager.enable = true;
}
