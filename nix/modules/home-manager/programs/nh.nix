{
  config,
  ...
}:

let
  inherit (config.home) homeDirectory;

in
{
  programs.nh = {
    clean.enable = true;
    flake = homeDirectory + "/.dotfiles";
  };
}
