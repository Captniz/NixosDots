{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  services = {
    postgresql = {
      enable = false;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };
    mongodb = {
      enable = false;
      package = pkgs.mongodb-ce;
    };
  };
}
