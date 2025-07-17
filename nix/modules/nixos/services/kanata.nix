{
  inputs,
  lib,
  ...
}:

let
  inherit (builtins) to String;

  self = builtins.toString inputs.self;
  config = self + "/.config/kanata/kanata.kbd";

  inherit (lib) mkDefault;

in
{
  services.kanata = {
    enable = mkDefault true;
    keyboards.default.configFile = config;
  };
}
