{
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  jacobkoziej.networking.wireless.enable = true;

  networking.hostName = "voyager-1";

  services.xserver.enable = true;

  system.stateVersion = "24.11";
}
