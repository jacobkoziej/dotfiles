{
  host,
  lib,
  ...
}:

let
  inherit (lib.attrsets) genAttrs;

  users = [
    "jacobkoziej"
  ];

in
{
  home-manager.users = genAttrs users (user: {
    imports = [
      ../../../hosts/${host}/home-configuration.nix
      ./${user}
    ];
  });
}
