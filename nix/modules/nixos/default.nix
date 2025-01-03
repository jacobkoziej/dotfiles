{
  ...
}:

{
  imports = [
    ./services

    ./systemd.nix
  ];

  boot = import ./boot.nix;
}
