{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  virtualisation = {
    docker = {
      enable = mkDefault true;

      storageDriver = mkDefault "btrfs";

      autoPrune.enable = true;
    };
  };
}
