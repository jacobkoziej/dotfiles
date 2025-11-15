{
  inputs,
  lib,
  withSystem,
  ...
}:

let
  inherit (inputs) sops-nix;

  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs.home-manager.lib) homeManagerConfiguration;

  inherit (builtins) listToAttrs;
  inherit (builtins) map;
  inherit (builtins) stringLength;
  inherit (lib.attrsets) mapCartesianProduct;
  inherit (lib.attrsets) mergeAttrsList;
  inherit (lib.lists) optional;

  users = [
    "jacobkoziej"
  ];

  hosts = [
    {
      hostname = "iceroth";
      system = "x86_64-linux";
    }
    {
      hostname = "sockciety";
      system = "x86_64-linux";
    }
    {
      hostname = "uhh";
      system = "x86_64-linux";
    }
    {
      hostname = "voyager-1";
      system = "x86_64-linux";
    }
  ];

  genHomeConfig =
    {
      user,
      host,
    }:

    {
      pkgs,
      ...
    }:

    homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        inherit inputs;
      };

      modules = [
        ./homes/${user}
      ]
      ++ optional (stringLength host > 0) ./hosts/${host}/home-configuration.nix;
    };

  genNixosSystem =
    {
      hostname,
      system,
    }:

    nixosSystem {
      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hosts/${hostname}/configuration.nix
        ./hosts/configuration.nix
        sops-nix.nixosModules.sops
        {
          nixpkgs.hostPlatform = system;
        }
      ];
    };

in
{
  flake = {
    homeConfigurations = mergeAttrsList (
      mapCartesianProduct
        (
          { user, host }:

          {
            "${user}@${host.hostname}" = withSystem host.system (genHomeConfig {
              inherit user;
              host = host.hostname;
            });
          }
        )
        {
          user = users;
          host = hosts;
        }
    );

    nixosConfigurations = listToAttrs (
      map (host: {
        name = host.hostname;
        value = genNixosSystem host;
      }) hosts
    );
  };
}
