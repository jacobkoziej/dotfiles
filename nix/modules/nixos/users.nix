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
  };

  users = {
    extraGroups = {
      "plugdev" = { };
      "ssh" = { };
    };

    mutableUsers = false;

    users = {
      "jacobkoziej" = {
        extraGroups = [
          "audio"
          "dialout"
          "input"
          "plugdev"
          "ssh"
          "video"
          "wheel"
        ];
        isNormalUser = true;
        linger = true;
        shell = pkgs.zsh;
        hashedPasswordFile = secrets."users/jacobkoziej/password-hash".path;
        home = "/home/jacobkoziej";
      };
    };
  };
}
