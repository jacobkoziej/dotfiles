{
  config,
  pkgs,
  ...
}:

let
  secrets = config.sops.secrets;

in
{
  sops.secrets = {
    "users/jacobkoziej/password-hash".neededForUsers = true;
    "users/root/password-hash".neededForUsers = true;
  };

  users = {
    extraGroups = {
      "plugdev" = { };
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
