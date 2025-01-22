{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.jacobkoziej.services.web-browser;

in
{
  options.jacobkoziej.services.web-browser = {
    enable = lib.mkEnableOption "messaging";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
    ];

    programs.librewolf.enable = true;
  };
}
