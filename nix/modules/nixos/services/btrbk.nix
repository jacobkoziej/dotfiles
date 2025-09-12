{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkDefault;
  inherit (lib) mkIf;

  enableLocalRoot = config.fileSystems ? "/mnt/root";

in
{
  services.btrbk = {
  };

  services = {
    btrbk = {
      instances = {
        "root" = mkIf enableLocalRoot {
          onCalendar = "hourly";

          settings = {
            timestamp_format = "long-iso";

            archive_preserve = mkDefault "0h 1d 1w 1m 1y";
            archive_preserve_min = mkDefault "latest";

            volume = {
              "/mnt/root" = {
                snapshot_dir = "snapshots";
                snapshot_create = "onchange";
                incremental = "yes";

                snapshot_preserve = "24h 14d 6w 3m 1y";
                snapshot_preserve_min = "latest";
                target_preserve = "0h 14d 6w 3m 1y";
                target_preserve_min = "latest";

                subvolume = mkDefault {
                  "subvolumes/home" = { };
                  "subvolumes/nixos" = { };
                  "subvolumes/root" = { };
                };
              };
            };
          };
        };
      };
    };
  };
}
