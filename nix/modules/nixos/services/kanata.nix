{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;
  inherit (lib) fileset;

  path = ../../../../.config/kanata;

  config = fileset.toSource {
    root = path;
    fileset = path;
  };

in
{
  services.kanata = {
    enable = mkDefault true;
    keyboards.default.configFile = "${config}/kanata.kbd";
  };
}
