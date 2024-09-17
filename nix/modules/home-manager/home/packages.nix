{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    git
    git-lfs
    neovim
    tmux
  ];
}
