{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkIf;

  cfg = config.services.openssh;

in
{
  services.openssh = {
    enable = lib.mkDefault true;
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
}
