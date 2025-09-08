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
    ./networking.nix
    ./sops.nix
    ./systemd.nix
    ./users.nix
    ./zram-swap.nix
  ];
}
