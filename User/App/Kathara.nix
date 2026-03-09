{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:
{
  # Flake from https://github.com/0xc000022070/zen-browser-flake
  imports = [
    inputs.kathara.homeManagerModules.default
  ];
  
  programs.kathara = {
    enable = true;
    manager = "docker";
    image = "kathara/base";
    terminal = "/usr/bin/xterm";
    openTerminals = true;
    deviceShell = "/bin/bash";
    netPrefix = "kathara";
    devicePrefix = "kathara";
    debugLevel = "INFO";
    printStartupLog = true;
    enableIpv6 = false;

    # Optional: additional raw keys written to kathara.conf
    settings = { };
  };
}
