{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkDefault;
  inherit (lib) mkIf;
  inherit (lib) optional;

  cfg = config.programs.mosh;
  tailscale-cfg = config.services.tailscale;

  tailscaleEnabled = tailscale-cfg.enable;
  tailscaleIface = tailscale-cfg.interfaceName;

  openFirewall = cfg.enable && tailscaleEnabled;

in
{
  programs.mosh = {
    enable = mkDefault true;
    openFirewall = false;
  };

  networking.firewall.interfaces.${tailscaleIface}.allowedUDPPortRanges = optional openFirewall {
    from = 60000;
    to = 61000;
  };
}
