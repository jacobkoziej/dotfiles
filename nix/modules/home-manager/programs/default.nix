_:

{
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./discord.nix
    ./git.nix
    ./gpg.nix
    ./nh.nix
    ./ssh.nix
  ];

  programs = {
    home-manager.enable = true;
  };
}
