{
  config,
  lib,
  modulesPath,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  jacobkoziej.hardware.battery.enable = true;

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "sd_mod"
        "usb_storage"
        "xhci_pci"
      ];

      luks.devices."root".device = "/dev/disk/by-label/luks:root";

      network = {
        enable = false;
      };
    };

    kernelModules = [
      "kvm-intel"
    ];
  };

  hardware = {
    cpu.intel.updateMicrocode = mkDefault config.hardware.enableRedistributableFirmware;

    bluetooth = {
      enable = true;

      powerOnBoot = true;
    };
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

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  services.tlp.enable = true;

  swapDevices = [
    {
      device = "/mnt/swap/file";
    }
  ];
}
