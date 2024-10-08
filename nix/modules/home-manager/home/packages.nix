{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    cachix
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
    sd
    tmux
    zoxide
  ];
}
