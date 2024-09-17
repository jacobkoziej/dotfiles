{ lib, ... }:

let
  username = "jacobkoziej";

in
{
  home = {
    username = lib.mkDefault username;
    homeDirectory = lib.mkDefault "/home/${username}";

    stateVersion = "24.05";
  };
}
