{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkIf;

in
{
  services.nginx = {
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    commonHttpConfig = ''
      allow 127.0.0.1;
      allow ::1;
      deny all;
    '';

    virtualHosts = {
      "_" = {
        default = true;

        listenAddresses = [
          "0.0.0.0"
          "[::]"
        ];

        rejectSSL = true;
        extraConfig = ''
          deny all;
        '';
      };
    };
  };

  networking.firewall.allowedTCPPorts = mkIf config.services.nginx.enable [
    80
    443
  ];
}
