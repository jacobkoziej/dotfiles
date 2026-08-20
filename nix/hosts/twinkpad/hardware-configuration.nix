{
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

    supportedFilesystems = [
      "ntfs"
    ];
  };

  hardware = {
    acpilight.enable = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    cpu.intel = {
      npu.enable = true;
      updateMicrocode = true;
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

  powerManagement.enable = true;

  services = {
    auto-cpufreq.enable = true;
    thermald.enable = true;
  };

  swapDevices = [
    {
      device = "/mnt/swap/file";
    }
  ];
}
