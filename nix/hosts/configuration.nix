{
  inputs,
  lib,
  ...
}:

{
  imports = [
    ../modules/nixos
  ];

  nix = {
    optimise = {
      automatic = true;
      dates = [
        "daily"
      ];
      persistent = true;
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://nix-community.cachix.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [
        "@wheel"
      ];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      inputs.nur-packages.overlays.default
    ];
  };

  time.timeZone = lib.mkDefault "America/New_York";
}
