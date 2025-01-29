_:

{
  imports = [
    ./gpg-agent.nix
  ];

  services = {
    ollama.enable = true;
  };
}
