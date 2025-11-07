{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkDefault;
  inherit (lib) optionals;

  cfg = config.services.pcscd;

in
{
  services = {
    pcscd = {
      enable = mkDefault true;
    };

    udev.packages = optionals cfg.enable (
      with pkgs;
      [
        yubikey-personalization
      ]
    );
  };
}
