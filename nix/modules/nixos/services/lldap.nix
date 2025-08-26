{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  inherit (builtins) toString;
  inherit (lib) mkIf;

  cfg = config.services.lldap;
  secrets = toString inputs.secrets;
  credentials = "/run/credentials/lldap.service";

  secret = "services/lldap";
  certFile = "${secret}/ldap.jacobkoziej.xyz.pem";
  keyFile = "${secret}/ldap.jacobkoziej.xyz-key.pem";
  userPass = "${secret}/user-pass";

in
{
  config = mkIf cfg.enable {
    services.lldap = {
      settings = {
        http_host = "127.0.0.1";
        ldap_base_dn = "dc=jacobkoziej,dc=xyz";
        ldap_host = "127.0.0.1";

        ldap_user_dn = "admin";
        ldap_user_pass_file = "${credentials}/user-pass";
        force_ldap_user_pass_reset = "always";

        ldaps_options = {
          enabled = true;
          port = 6360;

          cert_file = "${secrets}/${certFile}";
          key_file = "${credentials}/key.pem";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      lldap-cli
    ];

    sops.secrets = {
      ${keyFile} = {
        format = "binary";
        sopsFile = secrets + "/" + keyFile;

        restartUnits = [
          "lldap.service"
        ];
      };

      ${userPass} = {
        format = "binary";
        sopsFile = secrets + "/" + userPass;

        restartUnits = [
          "lldap.service"
        ];
      };
    };

    systemd.services.lldap.serviceConfig.LoadCredential = [
      ("key.pem:" + config.sops.secrets.${keyFile}.path)
      ("user-pass:" + config.sops.secrets.${userPass}.path)
    ];
  };
}
