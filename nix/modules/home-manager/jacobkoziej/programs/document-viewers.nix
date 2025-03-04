{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.jacobkoziej.programs.document-viewers;

in
{
  options.jacobkoziej.programs.document-viewers = {
    enable = lib.mkEnableOption "document-viewers";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      calibre
      libreoffice
    ];

    programs = {
      zathura.enable = true;
    };
  };
}
