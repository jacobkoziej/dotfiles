_:

{
  imports = [
    ./direnv.nix
    ./gpg.nix
    ./nh.nix
  ];

  programs = {
    home-manager.enable = true;
  };
}
