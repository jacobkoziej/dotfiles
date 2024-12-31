inputs:

let
  lib = inputs.nixpkgs.lib;

  genAttrs = lib.attrsets.genAttrs;
  nixosSystem = lib.nixosSystem;

  systems = [
    "voyager-1"
  ];

in
genAttrs systems (
  system:

  nixosSystem {
    specialArgs = {
      inherit inputs;
    };

    modules = [
      ./hosts/configuration.nix
      ./hosts/${system}/configuration.nix
    ];
  }
)
