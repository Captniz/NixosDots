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
    jack.enable = true;
  };

  systemd.user.services.pipewire-pulse.path = [ pkgs.pulseaudio ];
}
