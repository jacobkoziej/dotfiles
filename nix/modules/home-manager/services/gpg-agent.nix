{
  pkgs,
  ...
}:

{
  services.gpg-agent = {
    enableExtraSocket = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-rofi;
  };
}
