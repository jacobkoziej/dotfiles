{
  lib,
  ...
}:

{
  options.jacobkoziej.networking = {
    wireless = {
      enable = lib.mkEnableOption "wireless";
    };
  };

  config.jacobkoziej.networking = {
    wireless = {
      enable = lib.mkDefault false;
    };
  };
}
