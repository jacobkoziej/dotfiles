{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "iceroth";

  services = {
    udev.packages = with pkgs; [
      openocd
    ];
    xserver.enable = true;
  };

  system.stateVersion = "25.05";
}
