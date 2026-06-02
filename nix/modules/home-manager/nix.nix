{
  pkgs,
  ...
}:

{
  nix = {
    package = pkgs.nix;

    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };
}
