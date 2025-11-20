{
  lib,
  ...
}:

let
  inherit (builtins) toString;
  inherit (lib) mkDefault;

  config = toString ../../../../.config/kanata/kanata.kbd;

in
{
  services.kanata = {
    enable = mkDefault true;
    keyboards.default.configFile = config;
  };
}
