{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkIf;

  cfg = config.services.lldap;

in
{
  services.lldap = {
    settings = {
      http_host = "127.0.0.1";
      ldap_base_dn = "dc=jacobkoziej,dc=xyz";
      ldap_host = "127.0.0.1";
    };
  };

  environment.systemPackages = mkIf cfg.enable [
    pkgs.lldap-cli
  ];
}
