{
  description = "Jacob Koziej's dotfiles";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    secrets = {
      url = "git+ssh://git.jacobkoziej.xyz/secrets.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:

    inputs.flake-utils.lib.eachDefaultSystem (
      system:

      let
        pkgs = import inputs.nixpkgs {
          inherit system;

          config.allowUnfree = true;
        };

      in
      {
        devShells = import ./nix/dev-shells.nix pkgs;

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
