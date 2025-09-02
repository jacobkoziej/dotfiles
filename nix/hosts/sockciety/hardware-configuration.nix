{
  config,
  inputs,
  lib,
  modulesPath,
  pkgs,
  ...
}:

let
  secrets = inputs.secrets.hosts.sockciety;

in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "r8169"
        "sd_mod"
        "usb_storage"
        "usbhid"
        "xhci_pci"
      ];

      luks.devices."root".device = "/dev/disk/by-label/luks:root";
    };

    kernel.sysctl = {
      "net.ipv4.conf.all.forwarding" = true;
      "net.ipv6.conf.all.forwarding" = true;
    };

    kernelModules = [
      "kvm-amd"
    ];
  };

  environment = {
    etc = {
      crypttab = {
        mode = "0600";
        text = ''
          big-chungus:disk0   /dev/disk/by-label/luks:big-chungus:disk0   /root/keyfiles/big-chungus/disk0   luks,nofail
          big-chungus:disk1   /dev/disk/by-label/luks:big-chungus:disk1   /root/keyfiles/big-chungus/disk1   luks,nofail
          big-chungus:parity0 /dev/disk/by-label/luks:big-chungus:parity0 /root/keyfiles/big-chungus/parity0 luks,nofail
        '';
      };
    };

    systemPackages = with pkgs; [
      mergerfs
      mergerfs-tools
    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvol=subvolumes/nixos"
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

    "/mnt/big-chungus" = {
      device = "/mnt/big-chungus.d/disk*";
      fsType = "fuse.mergerfs";
      depends = [
        "/mnt/big-chungus.d/disk0"
        "/mnt/big-chungus.d/disk1"
      ];
    };

    "/mnt/big-chungus.d/disk0" = {
      device = "/dev/mapper/big-chungus:disk0";
      fsType = "ext4";
    };

    "/mnt/big-chungus.d/disk1" = {
      device = "/dev/mapper/big-chungus:disk1";
      fsType = "ext4";
    };

    "/mnt/big-chungus.d/parity0" = {
      device = "/dev/mapper/big-chungus:parity0";
      fsType = "ext4";
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

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
