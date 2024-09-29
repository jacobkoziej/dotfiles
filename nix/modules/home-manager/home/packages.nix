{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    daemonize
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
