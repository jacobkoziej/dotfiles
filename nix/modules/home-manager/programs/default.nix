_:

{
  imports = [
    ./gpg.nix
    ./nh.nix
  ];

  programs = {
    home-manager.enable = true;
  };
}
