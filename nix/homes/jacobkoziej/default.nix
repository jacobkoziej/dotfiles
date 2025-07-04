{
  lib,
  ...
}:

{
  imports = [
    ../../modules/home-manager
    ./home.nix
    ./programs.nix
    ./services.nix
  ];
}
