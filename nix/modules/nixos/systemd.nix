{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  systemd = {
    network = {
      enable = true;
      wait-online.anyInterface = true;

      networks = {
        "10-en" = mkDefault {
          matchConfig.Name = "en*";
          networkConfig.DHCP = "yes";
        };
        "10-wl" = mkDefault {
          matchConfig.Name = "wl*";
          networkConfig.DHCP = "yes";
        };
      };
    };
  };
}
