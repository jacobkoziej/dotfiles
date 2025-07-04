{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.home) username;

  inherit (lib) mkDefault;

in
{
  home = {
    homeDirectory = mkDefault "/home/${config.home.username}";

    stateVersion = mkDefault "24.05";
  };
}
