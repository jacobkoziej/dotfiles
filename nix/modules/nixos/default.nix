{
  ...
}:

{
  imports = [
    ./jacobkoziej
    ./services

    ./home-manager.nix
    ./networking.nix
    ./systemd.nix
  ];

  boot = import ./boot.nix;
}
