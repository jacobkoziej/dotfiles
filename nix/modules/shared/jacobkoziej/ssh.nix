{
  lib,
  ...
}:

let
  inherit (lib) mkOption;
  inherit (lib) types;

in
{
  options.jacobkoziej.ssh = {
    authorizedKeys = mkOption {
      type = types.attrsOf types.str;
      description = "Authorized keys";
      default = {
        "patrick" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIABd2/Jl3r8OcRosKGK1A8Mu5gTEXN42af2EYNcGEr4K";
        "plankton" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKSdhpEg2S2S4R7WnO8S0OtGszO7GYTvzmje4Qc60Zic";
      };
    };
  };
}
