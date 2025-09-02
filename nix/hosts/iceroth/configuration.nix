{
  config,
  inputs,
  pkgs,
  ...
}:

let
  inherit (inputs) secrets;

  secrets-iceroth = secrets.hosts.iceroth;

in
{
  imports = [
    ./hardware-configuration.nix
  ];

  services = {
    udev.packages = with pkgs; [
      openocd
    ];
    xserver.enable = true;
  };

  systemd.network.networks = with secrets-iceroth.network; {
    "10-en" = {
      matchConfig = {
        Name = "en0";
      };
      networkConfig = {
        Address = address.v4 + "/" + subnet.v4;
        Gateway = gateway.v4;
      };
    };
  };

  networking.hostName = "iceroth";

  system.stateVersion = "25.05";
}
