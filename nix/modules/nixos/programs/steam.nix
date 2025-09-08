{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkDefault;
  inherit (lib) mkIf;

  cfg = config.programs.steam;

in
{
  config = mkIf cfg.enable {
    hardware = {
      xpadneo.enable = mkDefault true;
    };
  };
}
