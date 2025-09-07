_:

{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 4 --keep-since 28d";
    };
  };
}
