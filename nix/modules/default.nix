{
  flake = {
    homeModules = {
      default = ./home-manager;
      jacobkoziej = ./home-manager/jacobkoziej;
    };

    nixosModules = {
      default = ./nixos;
      jacobkoziej = ./nixos/jacobkoziej;
    };
  };
}
