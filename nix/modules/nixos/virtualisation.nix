{
  config,
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
      enableNvidia = mkDefault (config.nixpkgs.config.cudaSupport or false);

      storageDriver = mkDefault "btrfs";

      autoPrune.enable = true;
    };
  };
}
