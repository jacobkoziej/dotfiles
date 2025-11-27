{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkDefault;
  inherit (lib.attrsets) mapAttrsToList;
  inherit (lib.strings) concatLines;

  cfg = config.programs.ssh;

  authorizedKeys =
    let
      inherit (config.jacobkoziej.ssh) authorizedKeys;

    in
    concatLines (mapAttrsToList (comment: key: "${key} ${comment}") authorizedKeys);

in
{
  programs.ssh = {
    enable = mkDefault true;

    enableDefaultConfig = false;
  };

  home.file.".ssh/authorized_keys" = {
    inherit (cfg) enable;
    text = mkDefault authorizedKeys;
  };
}
