{
  pkgs,
  ...
}:

{
  imports = [
    ../modules/jacobkoziej
    ../modules/nixos
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";

  users.users = {
    "jacobkoziej" = {
      extraGroups = [
        "wheel"
      ];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };

  programs = {
    gnupg.agent.enable = true;
    neovim.enable = true;
    zsh.enable = true;
  };
}
