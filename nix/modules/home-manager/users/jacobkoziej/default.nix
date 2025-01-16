{ lib, ... }:

let
  username = "jacobkoziej";

in
{
  imports = [
    ./packages.nix
  ];

  home = {
    username = lib.mkDefault username;
    homeDirectory = lib.mkDefault "/home/${username}";

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
