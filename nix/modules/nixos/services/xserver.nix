{
  config,
  lib,
  ...
}:

let
  cfg = config.services.xserver;

in
{
  config = lib.mkIf cfg.enable {
    services.xserver = {
      autorun = false;
      displayManager.startx.enable = true;
    };
  };
}
