{
  ...
}:

{
  imports = [
    ./jacobkoziej
    ./programs
    ./security
    ./services

    ./boot.nix
    ./environment.nix
    ./hardware.nix
    ./networking.nix
    ./sops.nix
    ./systemd.nix
    ./users.nix
    ./virtualisation.nix
    ./zram-swap.nix
  ];
}
