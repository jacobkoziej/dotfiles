{
  config,
  lib,
  ...
}:

let
  cfg = config.jacobkoziej.hardware.battery;

in
{
  services.tlp = {
    inherit (cfg) enable;

    settings = {
      TLP_DEFAULT_MODE = "BAT";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
    };
  };
}
