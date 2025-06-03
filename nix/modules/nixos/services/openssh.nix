{
  lib,
  ...
}:

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
}
