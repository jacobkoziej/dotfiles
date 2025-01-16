inputs:

let
  lib = inputs.nixpkgs.lib;

  genAttrs = lib.attrsets.genAttrs;
  nixosSystem = lib.nixosSystem;

  hosts = [
    "voyager-1"
  ];

in
genAttrs hosts (
  host:

  nixosSystem {
    specialArgs = {
      inherit host;
      inherit inputs;
    };

    modules = [
      ./hosts/${host}/configuration.nix
      ./hosts/configuration.nix
      ./modules/home-manager
      inputs.home-manager.nixosModules.home-manager
    ];
  }
)
