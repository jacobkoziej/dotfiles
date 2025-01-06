{
  ...
}:

{
  imports = [
    ./services

    ./networking.nix
    ./systemd.nix
  ];

  boot = import ./boot.nix;
}
