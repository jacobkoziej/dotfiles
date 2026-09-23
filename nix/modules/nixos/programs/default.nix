{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  imports = [
    ./mosh.nix
    ./nh.nix
    ./steam.nix
  ];

  programs = {
    fuse.enable = mkDefault true;
    neovim.enable = true;
    zsh.enable = true;
  };
}
