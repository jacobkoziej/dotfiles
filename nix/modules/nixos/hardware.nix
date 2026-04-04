{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  hardware = {
    enableRedistributableFirmware = mkDefault true;
  };
}
