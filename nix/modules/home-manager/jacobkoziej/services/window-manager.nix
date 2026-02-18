{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.jacobkoziej.services.windowManager;

in
{
  options.jacobkoziej.services.windowManager = {
    enable = lib.mkEnableOption "window manager";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bspwm
      picom
      scrot
      sxhkd
      wmname
      xrdb
    ];

    services = {
      unclutter.enable = true;
    };
  };
}
