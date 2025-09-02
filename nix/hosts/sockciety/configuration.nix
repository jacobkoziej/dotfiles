{
  config,
  inputs,
  lib,
  ...
}:

let
  inherit (inputs) secrets;
  inherit (lib) mkBefore;

  sockciety-secrets = secrets.hosts.sockciety;

  cdn-ssh-port = secrets.cdns.nyc.ssh.ports.sockciety;

in
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.network.ssh.port = cdn-ssh-port;

  services = {
    headscale.enable = true;
    lldap.enable = true;

    nginx = {
      enable = true;

      commonHttpConfig = mkBefore (
        with secrets.services.headscale;
        ''
          allow ${address.v4}/${subnet.v4};
        ''
      );

      defaultListenAddresses = [
        sockciety-secrets.network.tailnet.v4
      ];

      virtualHosts = {
        "headscale.jacobkoziej.xyz" = {
          listenAddresses = [
            sockciety-secrets.network.address.v4
          ]
          ++ config.services.nginx.defaultListenAddresses;
        };
      };
    };

    openssh = with sockciety-secrets.network; {
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

    snapraid = {
      enable = true;

      extraConfig = ''
        autosave 256
      '';

      contentFiles = [
        "/var/lib/snapraid/big-chungus.content"
        "/mnt/big-chungus.d/disk0/big-chungus.content"
        "/mnt/big-chungus.d/disk1/big-chungus.content"
      ];
      dataDisks = {
        "disk0" = "/mnt/big-chungus.d/disk0";
        "disk1" = "/mnt/big-chungus.d/disk1";
      };
      exclude = [
        "/lost+found/"
      ];
      parityFiles = [
        "/mnt/big-chungus.d/parity0/big-chungus.parity"
      ];
    };
  };

  networking.firewall.interfaces.en0 = {
    allowedTCPPorts = [
      cdn-ssh-port
    ];
  };

  systemd.network.networks = with sockciety-secrets.network; {
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

  networking.hostName = "sockciety";

  system.stateVersion = "25.05";
}
