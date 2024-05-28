{ config, pkgs, lib, ... }:
  let
    vars = import ./Colors.nix;
  in
  {
    opt.example = lib.mkForce false;
  }