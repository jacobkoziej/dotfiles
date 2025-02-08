{
  config,
  ...
}:

let
  inherit (config.home) homeDirectory;

in
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = homeDirectory + "/.dotfiles";
  };
}
