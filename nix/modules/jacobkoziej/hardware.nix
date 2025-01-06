{
  lib,
  ...
}:

{
  options.jacobkoziej.hardware = {
    battery = {
      enable = lib.mkEnableOption "battery";
    };
  };

  config.jacobkoziej.hardware = {
    battery = {
      enable = lib.mkDefault false;
    };
  };
}
