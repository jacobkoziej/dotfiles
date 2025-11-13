_:

{
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./discord.nix
    ./gpg.nix
    ./nh.nix
  ];

  programs = {
    home-manager.enable = true;
  };
}
