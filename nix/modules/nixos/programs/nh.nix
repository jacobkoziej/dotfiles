{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  programs.nh = {
    enable = true;
    clean = {
      enable = mkDefault false;

      dates = "daily";
      extraArgs = "--keep 4 --keep-since 28d";
    };
  };
}
