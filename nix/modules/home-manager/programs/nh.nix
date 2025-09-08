{
  config,
  ...
}:

let
  inherit (config.home) homeDirectory;

in
{
  programs.nh = {
    clean = {
      enable = true;

      dates = "daily";
      extraArgs = "--keep 4 --keep-since 28d";
    };
    flake = homeDirectory + "/.dotfiles";
  };
}
