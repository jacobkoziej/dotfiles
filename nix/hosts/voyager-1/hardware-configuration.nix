{
  inputs,
  ...
}:

let
  inherit (builtins) toString;

  secrets = inputs.secrets.hosts.voyager-1;

in
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

    kernelParams = [
      "resume_offset=${toString secrets.boot.resumeOffset}"
    ];

    resumeDevice = "/dev/disk/by-label/root";
  };

  hardware = {
    acpilight.enable = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    cpu.intel.updateMicrocode = true;
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

  powerManagement.enable = true;

  services = {
    logind.settings.Login = {
      HandleLidSwitch = "suspend-then-hibernate";
      HandleLidSwitchDocked = "ignore";
      HandlePowerKey = "hibernate";
    };

    auto-cpufreq.enable = true;
    thermald.enable = true;
  };

  swapDevices = [
    {
      device = "/mnt/swap/file";
    }
  ];

  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "1h";
  };
}
