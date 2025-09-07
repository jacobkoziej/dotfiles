{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  zramSwap = {
    enable = mkDefault true;

    algorithm = "zstd";
    memoryPercent = 50;
  };
}
