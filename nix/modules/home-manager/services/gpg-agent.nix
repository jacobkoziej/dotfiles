{
  pkgs,
  ...
}:

{
  services.gpg-agent = {
    enable = true;
    enableExtraSocket = true;
    pinentry.package = pkgs.pinentry-rofi;
  };
}
