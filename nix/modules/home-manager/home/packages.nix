{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    direnv
    eza
    git
    git-lfs
    neovim
    tmux
  ];
}
