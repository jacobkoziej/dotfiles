{
  config,
  inputs,
  lib,
  ...
}:

let
  base-domain = "jacobkoziej.xyz";
  domain = "headscale.${base-domain}";

  inherit (builtins) toString;
  inherit (lib) mkIf;
  inherit (inputs) secrets;

  cfg = config.services.headscale;

in
{
  services = {
    headscale = {
      address = "127.0.0.1";

      settings = {
        server_url = "https://${domain}:443";

        metrics_listen_addr = "127.0.0.1:9090";
        grpc_listen_addr = "127.0.0.1:50443";
        grpc_allow_insecure = false;

        prefixes = with secrets.services.headscale; {
          allocation = "random";
          v4 = address.v4 + "/" + subnet.v4;
          v6 = address.v6 + "/" + subnet.v6;
        };

        dns = {
          magic_dns = true;
          base_domain = "tailnet.${base-domain}";

          search_domains = [
            "host.${base-domain}"
            "private.${base-domain}"
          ];

          extra_records = with secrets.hosts; [
            {
              name = "iceroth.host.${base-domain}";
              type = "A";
              value = iceroth.network.tailnet.v4;
            }
            {
              name = "sockciety.host.${base-domain}";
              type = "A";
              value = sockciety.network.tailnet.v4;
            }
            {
              name = "voyager-1.host.${base-domain}";
              type = "A";
              value = voyager-1.network.tailnet.v4;
            }
          ];

          nameservers.global = [
            "1.1.1.1"
            "1.0.0.1"
            "2606:4700:4700::1111"
            "2606:4700:4700::1001"
          ];
        };
      };
    };

    nginx.virtualHosts.${domain} = mkIf cfg.enable {
      forceSSL = true;
      enableACME = true;

      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString cfg.port}";
        proxyWebsockets = true;
      };

      extraConfig = ''
        allow all;
      '';
    };
  };
}
