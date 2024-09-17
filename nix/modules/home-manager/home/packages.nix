{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    direnv
    git
    git-lfs
    neovim
    tmux
  ];
}
