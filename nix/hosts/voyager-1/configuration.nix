{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  networking = {
    domain = "host.jacobkoziej.xyz";
    hostName = "voyager-1";
    networkmanager.enable = true;
    wireless.iwd.enable = true;
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

  system.stateVersion = "24.11";
}
