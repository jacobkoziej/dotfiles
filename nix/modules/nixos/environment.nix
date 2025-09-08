{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) optionals;

in
{
  environment = {
    systemPackages = optionals config.hardware.bluetooth.enable [ pkgs.bluetui ];
  };
}
