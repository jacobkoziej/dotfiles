{
  inputs,
  ...
}:

let
  secrets = inputs.secrets.hosts.iceroth;

in
{
  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "e1000e"
        "nvme"
        "sd_mod"
        "usb_storage"
        "usbhid"
        "xhci_pci"
      ];

      luks.devices."root".device = "/dev/disk/by-label/luks:root";
    };

    kernelModules = [
      "btusb"
      "kvm-intel"
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

    "/mnt/root" = {
      device = "/dev/disk/by-label/root";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvolid=5"
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

  hardware = {
    bluetooth = {
      enable = true;

      powerOnBoot = true;
    };

    ckb-next.enable = true;

    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
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
}
