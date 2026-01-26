{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkForce;
  inherit (lib) mkIf;

  cfg = config.services.xserver;

in
{
  config = mkIf cfg.enable {
    services = {
      displayManager.enable = mkForce false;

      xserver = {
        autorun = false;
        displayManager.startx.enable = true;
      };
    };
  };
}
