{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    neovim
    tmux
  ];
}
