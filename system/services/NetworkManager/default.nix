{profile, ...}:
{
  networking.networkmanager = {
    enable = true;
    insertNameservers = profile.network.dns.ipv4 ++ profile.network.dns.ipv6;
    dns = "systemd-resolved";
    wifi.backend = "iwd";
  };
}
