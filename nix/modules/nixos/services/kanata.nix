{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (builtins) pathExists;
  inherit (lib) mkDefault;
  inherit (lib) fileset;

  inherit (config.networking) hostName;

  path = ../../../../.config/kanata;

  src = fileset.toSource {
    root = path;
    fileset = path;
  };

  layout =
    if pathExists (path + "/layout/${hostName}.kbd") then
      "layout/${hostName}.kbd"
    else
      "layout/default.kbd";

  kanata-config = pkgs.runCommand "kanata-config" { } ''
    cp -r ${src} $out
    chmod u+w $out
    ln -s ${layout} $out/layout.kbd
  '';

in
{
  services.kanata = {
    enable = mkDefault true;
    keyboards.default.configFile = "${kanata-config}/kanata.kbd";
  };
}
