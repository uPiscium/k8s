{ hostname, ... }:
{
  services.openssh.enable = true;
  programs.ssh.startAgent = true;
  programs.kdeconnect.enable = true;

  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  networking.nameservers = [ "8.8.8.8" "8.8.4.4" "1.1.1.1" ]; # fallback DNS
  # networking.nameservers = [ "192.168.11.113" ];

  services.resolved.enable = true;
  networking.resolvconf.enable = false;

  services.avahi = {
    enable = true;
    openFirewall = true;
  };

  networking.defaultGateway = "192.168.11.1";
}
