{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    tmux
  ];
}
