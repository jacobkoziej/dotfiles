{
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

in
{
  services = {
    gpg-agent.enable = mkDefault true;
    ollama.enable = mkDefault true;
  };
}
