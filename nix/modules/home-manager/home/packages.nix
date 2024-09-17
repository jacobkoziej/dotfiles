{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    git-lfs
    neovim
    tmux
  ];
}
