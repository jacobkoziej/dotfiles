{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  jacobkoziej.networking.wireless.enable = true;

  networking.hostName = "voyager-1";

  services = {
    automatic-timezoned.enable = true;
    udev.packages = with pkgs; [
      openocd
      yubikey-personalization
    ];
    xserver.enable = true;
  };

  system.stateVersion = "24.11";
}
