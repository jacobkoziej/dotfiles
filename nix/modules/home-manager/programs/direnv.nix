{
  inputs,
  lib,
  ...
}:

let
  self = builtins.toString inputs.self;
  config = self + "/.config/direnv/direnv.toml";

  inherit (lib) importTOML;

in
{
  programs.direnv = {
    config = importTOML config;
  };
}
