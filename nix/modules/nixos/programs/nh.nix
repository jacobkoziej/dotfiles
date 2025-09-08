_:

{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;

      dates = "daily";
      extraArgs = "--keep 4 --keep-since 28d";
    };
  };
}
