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

in
{
  imports = [
    ./hardware-configuration.nix
  ];

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
