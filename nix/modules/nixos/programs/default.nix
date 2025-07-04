{
  lib,
  ...
}:

{
  imports = [
    ./nh.nix
  ];

  programs = {
    mosh.enable = lib.mkDefault true;
    neovim.enable = true;
    zsh.enable = true;
  };
}
