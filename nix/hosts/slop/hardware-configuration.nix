{
  config,
  inputs,
  lib,
  ...
}:

let
  inherit (lib) mkForce;

  secrets = inputs.secrets.hosts.slop;

in
{
  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "sr_mod"
        "uhci_hcd"
        "virtio_blk"
        "virtio_net"
        "virtio_pci"
      ];

      luks.devices."root".device = "/dev/disk/by-label/luks:root";

      network.ssh.hostKeys = mkForce [
        "/etc/initrd/ssh/ssh_host_ed25519_key"
        "/etc/initrd/ssh/ssh_host_rsa_key"
      ];
    };

    loader = {
      efi.canTouchEfiVariables = mkForce false;

      grub = {
        enable = true;
        device = "/dev/disk/by-path/virtio-pci-0000:00:05.0";
      };

      systemd-boot.enable = mkForce false;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvol=subvolumes/nixos"
        "x-systemd.device-timeout=0"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = [
        "dmask=0022"
        "fmask=0022"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvol=subvolumes/home"
      ];
    };

    "/mnt/swap" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [
        "subvol=swap"
      ];
    };

    "/root" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvol=subvolumes/root"
      ];
    };
  };

  swapDevices = [
    {
      device = "/mnt/swap/file";
    }
  ];

  systemd.network.links = with secrets.network; {
    "10-en" = {
      matchConfig = {
        PermanentMACAddress = MACAddress;
      };
      linkConfig = {
        Name = "en0";
      };
    };
  };

  virtualisation.hypervGuest.enable = true;
}
