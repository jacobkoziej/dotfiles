{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkIf;

  cfg = config.services.openssh;

  cfg-tailscale = config.services.tailscale;

  tailscaleEnabled = cfg-tailscale.enable;
  tailscaleIface = cfg-tailscale.interfaceName;

  openFirewall = cfg.enable && tailscaleEnabled;

in
{
  services.openssh = {
    enable = lib.mkDefault true;

    openFirewall = false;

    settings = {
      AllowGroups = [
        "root"
        "ssh"
      ];
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
      StreamLocalBindUnlink = true;
      X11Forwarding = true;
    };
  };

  systemd.services.sshd = mkIf cfg.enable {
    wants = [
      "network-online.target"
    ];
    after = [
      "network-online.target"
    ];
  };

  networking.firewall.interfaces.${tailscaleIface}.allowedTCPPorts = mkIf openFirewall [
    22
  ];
}
