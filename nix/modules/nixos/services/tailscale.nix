{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkDefault;
  inherit (lib) mkForce;
  inherit (lib) mkIf;

  cfg = config.services.tailscale;

in
{
  services.tailscale = {
    enable = mkDefault true;
  };

  systemd.services.tailscaled = mkIf cfg.enable {
    wants = mkForce [
      "network.target"
    ];
    after = mkForce [
      "network.target"
    ];
  };

  systemd.services.tailscale-online = mkIf cfg.enable {
    wants = [
      "tailscaled.service"
    ];
    after = [
      "tailscaled.service"
    ];
    before = [
      "network-online.target"
    ];

    wantedBy = [
      "network-online.target"
    ];

    serviceConfig =
      let
        inherit (builtins) toString;

        cfg-systemd = config.systemd;

        systemd-networkd-wait-online = "${cfg-systemd.package}/lib/systemd/systemd-networkd-wait-online";
        timeout = toString cfg-systemd.network.wait-online.timeout;

      in
      {
        ExecStart = "${systemd-networkd-wait-online} --interface=${cfg.interfaceName} -4 -6 --timeout=${timeout}";
        Type = "oneshot";
        RemainAfterExit = true;
      };
  };
}
