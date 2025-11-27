{
  lib,
  pkgs,
  ...
}:

let
  inherit (pkgs) python3;

  inherit (lib) mkDefault;
  inherit (lib) optionals;
  inherit (pkgs.stdenv) isLinux;

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

    packages =
      with pkgs;
      [
        bat
        cachix
        daemonize
        duf
        eza
        fd
        fzf
        htop
        inetutils
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
      ]
      ++ optionals isLinux [
        iproute2
      ];
  };
}
