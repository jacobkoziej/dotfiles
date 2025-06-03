{
  pkgs,
  ...
}:

let
  inherit (pkgs) python3;

  python3-pkgs = python3.withPackages (
    ps: with ps; [
      ipython
      numpy
      scipy
    ]
  );

in
{
  home.packages = with pkgs; [
    bat
    cachix
    daemonize
    direnv
    duf
    eza
    fd
    fzf
    git
    git-lfs
    htop
    inetutils
    iproute2
    killall
    mosh
    ncdu
    neovim
    openssh
    pciutils
    procps
    python3-pkgs
    ripgrep
    rsync
    sd
    sshfs
    tinyxxd
    tmux
    tmuxp
    unzip
    wget
    zip
    zoxide
  ];
}
