{
  config,
  lib,
  ...
}:

let
  inherit (builtins) toString;
  inherit (lib) importTOML;

  cfg = config.programs.direnv;

  direnvConfig = toString ../../../../.config/direnv/direnv.toml;

in
{
  programs.direnv = {
    config = importTOML direnvConfig;
    nix-direnv.enable = cfg.enable;
  };
}
