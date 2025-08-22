{
  lib,
  ...
}:

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

          authorizedKeys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINQeA0J16znzRrtqvh5xM014+CcIEetO8uu4dobmcMta jacobkoziej@iceroth.host.jacobkoziej.xyz"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKEYZmYvejeN8+3cw33v7U5dp4aOKbVqfhQ+aZRheMII jacobkoziej@voyager-1.host.jacobkoziej.xyz"
          ];
          hostKeys = [
            "/etc/ssh/ssh_host_ed25519_key"
            "/etc/ssh/ssh_host_rsa_key"
          ];
        };
      };
    };

    kernelParams = [
      "ip=dhcp"
    ];
  };
}
