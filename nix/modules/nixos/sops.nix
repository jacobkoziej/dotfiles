{
  inputs,
  ...
}:

let
  secrets = builtins.toString inputs.secrets;

in
{
  sops = {
    age = {
      keyFile = "/var/lib/sops-nix/key.txt";

      sshKeyPaths = [
        "/etc/ssh/ssh_host_ed25519_key"
      ];
      generateKey = true;
    };

    defaultSopsFile = secrets + "/secrets.yaml";

    validateSopsFiles = false;
  };
}
