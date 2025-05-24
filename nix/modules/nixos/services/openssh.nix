{
  lib,
  ...
}:

{
  services.openssh = {
    enable = lib.mkDefault true;
    settings = {
      AllowGroups = [ "ssh" ];
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
      X11Forwarding = true;
    };
  };
}
