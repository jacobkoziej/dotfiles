{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  imports = [
    ./auto-cpufreq.nix
    ./btrbk.nix
    ./btrfs.nix
    ./headscale.nix
    ./kanata.nix
    ./lldap.nix
    ./nginx.nix
    ./openssh.nix
    ./pcscd.nix
    ./tailscale.nix
    ./xserver.nix
  ];

  services = {
    blueman.enable = config.hardware.bluetooth.enable;
    fwupd.enable = mkDefault true;
  };
}
