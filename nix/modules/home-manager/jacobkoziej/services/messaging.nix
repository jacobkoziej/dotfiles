{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkEnableOption;
  inherit (lib) mkIf;

  cfg = config.jacobkoziej.services.messaging;

in
{
  options.jacobkoziej.services.messaging = {
    enable = mkEnableOption "messaging";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      discord
      element-desktop
      signal-desktop
    ];

    programs = {
      discord.enable = true;
    };
  };
}
