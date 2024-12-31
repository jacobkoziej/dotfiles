{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "voyager-1";
    wireless.iwd.enable = true;
  };

  system.stateVersion = "24.11";
}
