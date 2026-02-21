{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  # Pipewire audio service
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    systemWide = false;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 32;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 32;
      };
    };
    jack.enable = true;

    wireplumber = {
      enable = true;
      extraConfig = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [
            "hsp_hs"
            "hsp_ag"
            "hfp_hf"
            "hfp_ag"
          ];
        };
      };
    };
  };

  systemd.user.services.pipewire-pulse.path = [ pkgs.pulseaudio ];
}
