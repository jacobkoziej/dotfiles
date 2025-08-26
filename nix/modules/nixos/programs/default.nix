{
  lib,
  ...
}:

{
  imports = [
    ./mosh.nix
    ./nh.nix
  ];

  programs = {
    neovim.enable = true;
    zsh.enable = true;
  };
}
