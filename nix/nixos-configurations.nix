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
      ./hosts/${system}/configuration.nix
      ./hosts/configuration.nix
      ./modules/home-manager
      inputs.home-manager.nixosModules.home-manager
    ];
  }
)