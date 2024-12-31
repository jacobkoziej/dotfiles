{
  pkgs,
  ...
}:

{
  imports = [
    ../modules/nixos
  ];

  networking = {
    domain = "host.jacobkoziej.xyz";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
