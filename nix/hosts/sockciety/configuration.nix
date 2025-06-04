{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  services = {
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

  networking.hostName = "sockciety";

  system.stateVersion = "25.05";
}
