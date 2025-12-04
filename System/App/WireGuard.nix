{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:
{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };
  # Enable WireGuard
  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the client's end of the tunnel interface.
      ips = [ "10.44.117.3/32" ];
      listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      mtu = 1300;
      privateKey = "8GgcPvdtyLThgBpmbBVk/lqBG/TK/KO4vNbXYLtJf00="; # set to true to auto-generate key if file not exists

      peers = [
        # For a client configuration, one peer entry for the server will suffice.

        {
          # Public key of the server (not a file path).
          publicKey = "ygRKQWr26jpK4F4L3b8vvnwgyIjM2YuYpOr0KdNRSSQ=";

          # Forward all the traffic via VPN.
          allowedIPs = [
            "10.44.0.0/16"
            "91.98.46.45/32"
          ];
          # Or forward only particular subnets
          #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

          # Set this to the server IP and port.
          endpoint = "91.98.148.200:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 5;
        }
      ];
    };
  };
}
