{
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  jacobkoziej.networking.wireless.enable = true;

  networking = {
    hostName = "voyager-1";
    wireless.iwd.enable = config.jacobkoziej.networking.wireless.enable;
  };

  system.stateVersion = "24.11";
}
