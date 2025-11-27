{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.home) username;

  inherit (lib) mkDefault;
  inherit (pkgs.stdenv) isDarwin;

  homeDirectoryRoot = if isDarwin then "/Users" else "/home";

in
{
  home = {
    homeDirectory = mkDefault "${homeDirectoryRoot}/${username}";

    stateVersion = mkDefault "24.05";
  };
}
