{
  description = "Jacob Koziej's dotfiles";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs:

    inputs.flake-utils.lib.eachDefaultSystem (
      system:

      let
        pkgs = import inputs.nixpkgs { inherit system; };

        homeManagerConfiguration = inputs.home-manager.lib.homeManagerConfiguration;

      in
      {
        formatter = pkgs.nixfmt-rfc-style;

        packages = {
          homeConfigurations.jacobkoziej = homeManagerConfiguration {
            inherit pkgs;

            extraSpecialArgs = {
              inherit inputs;
            };

            modules = [
              ./nix/modules/home-manager
            ];
          };

          nixosConfigurations = import ./nix/nixos-configurations.nix inputs;
        };
      }
    );
}
