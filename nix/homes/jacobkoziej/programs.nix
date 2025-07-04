{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  programs = {
    direnv.enable = mkDefault true;
    gpg.enable = mkDefault true;
    nh.enable = mkDefault true;
  };
}
