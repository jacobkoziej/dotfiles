{
  config,
  lib,
  ...
}:

let
  cfg = config.jacobkoziej.networking;

in
{
  networking = {
    domain = "host.jacobkoziej.xyz";
    useDHCP = lib.mkDefault false;

    wireless.iwd.enable = cfg.wireless.enable;
  };
}
