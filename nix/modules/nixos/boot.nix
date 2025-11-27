{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkDefault;

  authorizedKeys =
    let
      inherit (builtins) attrValues;

    in
    attrValues config.jacobkoziej.ssh.authorizedKeys;

in
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    initrd = {
      network = {
        enable = lib.mkDefault true;

        ssh = {
          enable = true;

          authorizedKeys = mkDefault authorizedKeys;
          hostKeys = [
            "/etc/ssh/ssh_host_ed25519_key"
            "/etc/ssh/ssh_host_rsa_key"
          ];
        };
      };
    };

    kernelParams = [
      "ip=::::${config.networking.hostName}::dhcp"
    ];
  };
}
