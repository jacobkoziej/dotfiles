{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  programs = {
    steam.enable = true;
  };

  services = {
    udev.packages = with pkgs; [
      openocd-nightly
    ];
    xserver.enable = true;
  };

  time.timeZone = "America/Los_Angeles";

  networking.hostName = "uhh";

  system.stateVersion = "25.05";
}
