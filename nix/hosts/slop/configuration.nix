{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  inherit (inputs) secrets;
  inherit (lib) mkBefore;

  cdn-ssh-port = secrets.cdns.oregon.ssh.ports.slop;

in
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.network.ssh.port = cdn-ssh-port;

  services = {
    amazon-ssm-agent.enable = true;

    openssh = {
      listenAddresses = [
        {
          addr = "0.0.0.0";
          port = cdn-ssh-port;
        }
      ];
    };

    udev.packages = with pkgs; [
      amazon-ec2-utils
    ];
  };

  networking.firewall.interfaces.en0 = {
    allowedTCPPorts = [
      cdn-ssh-port
    ];
  };

  networking.hostName = "slop";

  system.stateVersion = "25.11";
}
