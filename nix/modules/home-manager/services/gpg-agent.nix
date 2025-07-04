{
  pkgs,
  ...
}:

{
  services.gpg-agent = {
    enableExtraSocket = true;
    pinentry.package = pkgs.pinentry-rofi;
  };
}
