{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.sops) secrets;
  inherit (lib) mkDefault;

in
{
  sops.secrets = {
    "users/jacobkoziej/password-hash".neededForUsers = true;
    "users/root/password-hash".neededForUsers = true;
  };

  users = {
    groups = {
      "plugdev" = { };
      "remote-nixbld" = { };
      "ssh" = { };
    };

    mutableUsers = false;

    users = {
      "jacobkoziej" = {
        isNormalUser = true;
        hashedPasswordFile = secrets."users/jacobkoziej/password-hash".path;

        extraGroups = [
          "audio"
          "cdrom"
          "dialout"
          "docker"
          "input"
          "plugdev"
          "ssh"
          "video"
          "wheel"
        ];

        linger = true;
        shell = pkgs.zsh;
      };

      "remote-nixbld" = {
        enable = mkDefault false;

        isSystemUser = true;

        group = "remote-nixbld";

        shell = pkgs.bash;
      };

      "root" = {
        isSystemUser = true;
        hashedPasswordFile = secrets."users/root/password-hash".path;

        uid = 0;
        group = "root";

        home = "/root";
        shell = pkgs.bash;
      };
    };
  };
}
