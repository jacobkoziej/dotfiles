{
  lib,
  ...
}:

{
  services.openssh = {
    enable = lib.mkDefault true;
    settings = {
      AllowGroups = [
        "ssh"
      ];
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
      StreamLocalBindUnlink = true;
      X11Forwarding = true;
    };
  };
}
