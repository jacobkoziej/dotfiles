{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkDefault;
  inherit (lib) optionals;

  cfg = config.fonts.fontconfig;

in
{
  fonts.fontconfig = {
    enable = mkDefault true;

    antialiasing = mkDefault true;
    hinting = mkDefault "none";
    subpixelRendering = mkDefault "rgb";
  };

  home.packages = optionals cfg.enable (
    with pkgs;
    [
      nerd-fonts.fira-code
    ]
  );
}
