{
  config,
  inputs,
  pkgs,
  ...
}:

let
  inherit (inputs) secrets;

  secrets-iceroth = secrets.hosts.iceroth;

  cdn-ssh-port = secrets.cdns.nyc.ssh.ports.iceroth;

in
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.network.ssh.port = cdn-ssh-port;

  programs = {
    steam.enable = true;
  };

  services = {
    openssh = with secrets-iceroth.network; {
      listenAddresses = [
        {
          addr = tailnet.v4;
        }
        {
          addr = address.v4;
          port = cdn-ssh-port;
        }
      ];
    };

    udev.packages = with pkgs; [
      openocd
    ];
    xserver.enable = true;
  };

  networking.firewall.interfaces.en0 = {
    allowedTCPPorts = [
      cdn-ssh-port
    ];
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
