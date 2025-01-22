{
  host,
  inputs,
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
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };

    useGlobalPkgs = true;
    useUserPackages = true;

    users = genAttrs users (user: {
      imports = [
        ../../homes/${user}
        ../../hosts/${host}/home-configuration.nix
      ];
    });
  };
}
