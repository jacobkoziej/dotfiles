{
  lib,
  ...
}:

let
  username = "jacobkoziej";

in
{
  imports = [
    ../../modules/home-manager
  ];

  home = {
    username = lib.mkDefault username;
    homeDirectory = lib.mkDefault "/home/${username}";

    stateVersion = "24.05";
  };
}
