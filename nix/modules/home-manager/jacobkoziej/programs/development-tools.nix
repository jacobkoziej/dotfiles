{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.jacobkoziej.programs.development-tools;

in
{
  options.jacobkoziej.programs.development-tools = {
    enable = lib.mkEnableOption "development-tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gcc
      gdb
      gnumake
    ];
  };
}
