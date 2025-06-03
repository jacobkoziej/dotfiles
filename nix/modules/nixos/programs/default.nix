{
  lib,
  ...
}:

{
  programs = {
    mosh.enable = lib.mkDefault true;
  };
}
