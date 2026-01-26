{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  hardware = {
    enableAllFirmware = mkDefault true;
  };
}
