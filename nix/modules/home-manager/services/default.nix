{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  imports = [
    ./gpg-agent.nix
  ];

  services = {
    syncthing.enable = mkDefault true;
  };
}
