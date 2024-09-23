{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    direnv
    eza
    fd
    fzf
    git
    git-lfs
    htop
    neovim
    procps
    ripgrep
    rsync
    tmux
    zoxide
  ];
}
