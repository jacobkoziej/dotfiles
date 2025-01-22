{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.jacobkoziej.services.messaging;

in
{
  options.jacobkoziej.services.messaging = {
    enable = lib.mkEnableOption "messaging";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      discord
      element-desktop
      signal-desktop
    ];
  };
}
