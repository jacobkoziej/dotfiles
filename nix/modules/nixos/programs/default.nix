{
  lib,
  ...
}:

{
  imports = [
    ./mosh.nix
    ./nh.nix
    ./steam.nix
  ];

  programs = {
    neovim.enable = true;
    zsh.enable = true;
  };
}
