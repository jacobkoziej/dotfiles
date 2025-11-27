{
  config,
  lib,
  pkgs,
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

    extraOptionOverrides = {
      AddKeysToAgent = "yes";
    };

    includes = [
      "config.d/*"
    ];
  };

  home.file.".ssh/authorized_keys" = {
    inherit (cfg) enable;
    text = mkDefault authorizedKeys;

    # we copy authorized_keys from /nix/store to prevent sshd from
    # rightfully getting upset about incorrect ownership permissions
    force = true;
    onChange =
      let
        inherit (lib) getExe';
        inherit (pkgs) coreutils;

        cp = getExe' coreutils "cp";
        realpath = getExe' coreutils "realpath";

        inherit (config.home.file.".ssh/authorized_keys") target;

      in
      ''
        ${cp} --remove-destination $(${realpath} ${target}) ${target}
      '';
  };
}
