{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkForce;
  inherit (pkgs.stdenv.hostPlatform) isDarwin;

  pinentryPackage = with pkgs; if isDarwin then pinentry_mac else pinentry-rofi;

in
{
  services.gpg-agent = {
    enableExtraSocket = true;
    enableSshSupport = true;
    pinentry.package = pinentryPackage;
  };

  sshAuthSock.enable = mkForce false;
}
