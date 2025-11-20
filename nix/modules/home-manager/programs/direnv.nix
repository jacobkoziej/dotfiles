{
  lib,
  ...
}:

let
  inherit (builtins) toString;
  inherit (lib) importTOML;

  config = toString ../../../../.config/direnv/direnv.toml;

in
{
  programs.direnv = {
    config = importTOML config;
  };
}
