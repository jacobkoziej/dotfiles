{
  pkgs,
  ...
}:

{
  users = {
    extraGroups = {
      "plugdev" = { };
      "ssh" = { };
    };

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
        shell = pkgs.zsh;
        home = "/home/jacobkoziej";
      };
    };
  };
}
