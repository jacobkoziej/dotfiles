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

  networking.hostName = "twinkpad";

  programs = {
    steam.enable = true;
  };

  services = {
    automatic-timezoned.enable = true;
    udev.packages = with pkgs; [
      openocd-nightly
      yubikey-personalization
    ];
    xserver.enable = true;
  };

  system.stateVersion = "26.05";
}
