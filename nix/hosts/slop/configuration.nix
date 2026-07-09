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
  inherit (lib) mkForce;

  slop-secrets = secrets.hosts.slop;

  cdn-ssh-port = secrets.cdns.la.ssh.ports.slop;

in
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.network.ssh.port = cdn-ssh-port;

  services = {
    headscale.enable = true;
    kanata.enable = false;

    nginx = {
      enable = true;

      commonHttpConfig = mkBefore (
        with secrets.services.headscale;
        ''
          allow ${address.v4}/${subnet.v4};
        ''
      );

      defaultListenAddresses = [
        slop-secrets.network.tailnet.v4
      ];

      virtualHosts = {
        "headscale.jacobkoziej.xyz" = {
          listenAddresses = [
            slop-secrets.network.address.v4
          ]
          ++ config.services.nginx.defaultListenAddresses;
        };
      };
    };

    openssh = with slop-secrets.network; {
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
  };

  networking.firewall.interfaces.en0 = {
    allowedTCPPorts = [
      cdn-ssh-port
    ];
  };

  time.timeZone = "America/Los_Angeles";

  networking.hostName = "slop";

  system.stateVersion = "26.05";
}
