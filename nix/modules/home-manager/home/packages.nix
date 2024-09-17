{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    direnv
    eza
    fd
    git
    git-lfs
    neovim
    tmux
  ];
}
