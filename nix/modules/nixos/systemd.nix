{
  lib,
  ...
}:

{
  systemd = {
    network = {
      enable = true;
      wait-online.anyInterface = true;

      networks = lib.mkDefault {
        "10-en" = {
          matchConfig.Name = "en*";
          networkConfig.DHCP = "yes";
        };
        "10-wlan" = {
          matchConfig.Name = "wlan*";
          networkConfig.DHCP = "yes";
        };
      };
    };
  };
}
