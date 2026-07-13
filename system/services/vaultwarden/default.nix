{
  services.vaultwarden = {
    enable = true;

    config = {
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;

      DOMAIN = "https://bitwarden.localhost";

      SIGNUPS_ALLOWED = false;
      INVITATIONS_ALLOWED = false;
    };
  };

  # services.nginx.virtualHosts."bitwarden.localhost" = {
  #   forceSSL = true;
  #   sslCertificate = "/var/lib/nginx/bitwarden.crt";
  #   sslCertificateKey = "/var/lib/nginx/bitwarden.key";

  #   locations."/" = {
  #     proxyPass = "http://127.0.0.1:8222";
  #     proxyWebsockets = true;
  #   };
  # };

  services.caddy.virtualHosts."bitwarden.localhost" = {
    extraConfig = ''
      reverse_proxy 127.0.0.1:8222
    '';
  };
}
