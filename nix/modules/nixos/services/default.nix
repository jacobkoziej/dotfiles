{
  config,
  ...
}:

{
  imports = [
    ./auto-cpufreq.nix
    ./btrfs.nix
    ./btrbk.nix
    ./headscale.nix
    ./kanata.nix
    ./lldap.nix
    ./nginx.nix
    ./openssh.nix
    ./tailscale.nix
    ./xserver.nix
  ];

  services = {
    blueman.enable = config.hardware.bluetooth.enable;
  };
}
