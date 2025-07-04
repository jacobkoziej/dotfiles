{
  lib,
  pkgs,
  ...
}:

let
  inherit (pkgs) python3;

  inherit (lib) mkDefault;

  python3-pkgs = python3.withPackages (
    ps: with ps; [
      ipython
      numpy
      scipy
    ]
  );

in
{
  home = {
    username = mkDefault "jacobkoziej";

    packages = with pkgs; [
      bat
      cachix
      daemonize
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
      riffdiff
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
  };
}
