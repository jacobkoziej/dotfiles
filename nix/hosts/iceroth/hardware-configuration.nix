{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

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

      luks.devices = {
        "root".device = "/dev/disk/by-label/luks-root";
        "scratch".device = "/dev/disk/by-label/luks:scratch";
      };
    };

    kernelModules = [
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

    "/nix/store" = {
      device = "/dev/disk/by-label/scratch";
      fsType = "btrfs";
      options = [
        "compress=zstd"
        "subvol=subvolumes/nix-store"
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
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      nvidiaSettings = true;
      open = false;
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  services.xserver.videoDrivers = [
    "nvidia"
  ];
}
