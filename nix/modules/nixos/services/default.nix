{
  config,
  ...
}:

{
  imports = [
    ./headscale.nix
    ./kanata.nix
    ./lldap.nix
    ./nginx.nix
    ./openssh.nix
    ./tailscale.nix
    ./tlp.nix
    ./xserver.nix
  ];

  services = {
    blueman.enable = config.hardware.bluetooth.enable;
  };
}
