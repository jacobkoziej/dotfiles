{
  pkgs,
  ...
}:

let
  inherit (pkgs) python3;

  python3-pkgs = python3.withPackages (
    ps: with ps; [
      ipython
    ]
  );

in
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
    killall
    mosh
    ncdu
    neovim
    openssh
    procps
    python3-pkgs
    ripgrep
    rsync
    sd
    tmux
    tmuxp
    unzip
    zip
    zoxide
  ];
}
