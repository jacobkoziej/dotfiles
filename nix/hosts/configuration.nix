{
  pkgs,
  ...
}:

{
  imports = [
    ../modules/nixos
  ];

  nix.settings = {
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

  nixpkgs = {
    config.allowUnfree = true;
  };

  time.timeZone = "America/New_York";

  users = {
    extraGroups = {
      "plugdev" = { };
      "ssh" = { };
    };
    users = {
      "jacobkoziej" = {
        extraGroups = [
          "audio"
          "dialout"
          "input"
          "plugdev"
          "ssh"
          "video"
          "wheel"
        ];
        isNormalUser = true;
        shell = pkgs.zsh;
        home = "/home/jacobkoziej";
      };
    };
  };

  programs = {
    gnupg.agent.enable = true;
    neovim.enable = true;
    zsh.enable = true;
  };
}
