{
  ...
}:

{
  imports = [
    ./systemd.nix
  ];

  boot = import ./boot.nix;
}
