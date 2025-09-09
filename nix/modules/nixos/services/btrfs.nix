{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  services.btrfs.autoScrub = {
    enable = mkDefault true;

    interval = "weekly";
    fileSystems = mkDefault [
      "/"
    ];
  };
}
