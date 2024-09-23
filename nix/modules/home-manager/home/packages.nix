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
    iproute2
    neovim
    procps
    ripgrep
    rsync
    tmux
    zoxide
  ];
}
