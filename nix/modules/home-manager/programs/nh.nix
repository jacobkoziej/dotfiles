{
  config,
  lib,
  ...
}:

let
  inherit (config.home) homeDirectory;
  inherit (lib) mkDefault;

in
{
  programs.nh = {
    clean = {
      enable = mkDefault false;

      dates = "daily";
      extraArgs = "--keep 4 --keep-since 28d";
    };
    flake = homeDirectory + "/.dotfiles";
  };
}
