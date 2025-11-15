{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

  cfg = config.jacobkoziej.networking;

in
{
  networking = {
    domain = mkDefault "host.jacobkoziej.xyz";
    useDHCP = mkDefault false;

    wireless.iwd.enable = cfg.wireless.enable;
  };
}
