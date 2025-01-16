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

      in
      {
        formatter = pkgs.nixfmt-rfc-style;

        packages = {
          homeConfigurations = import ./nix/home-configurations.nix {
            inherit inputs;
            inherit pkgs;
          };

          nixosConfigurations = import ./nix/nixos-configurations.nix inputs;
        };
      }
    );
}
