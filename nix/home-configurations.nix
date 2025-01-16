{
  inputs,
  pkgs,
}:

let
  inherit (pkgs) lib;

  inherit (lib.attrsets) genAttrs;
  inherit (inputs.home-manager.lib) homeManagerConfiguration;

  users = [
    "jacobkoziej"
  ];

in
genAttrs users (
  user:

  homeManagerConfiguration {
    inherit pkgs;

    extraSpecialArgs = {
      inherit inputs;
    };

    modules = [
      ./modules/home-manager/users/${user}
    ];
  }
)
