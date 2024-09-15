{ config, pkgs, ... }:
{
  programs.calibre = {
    enable = true;
  };

  networking.firewall.allowedUDPPorts = [ 8080 ];
  networking.firewall.allowedTCPPorts = [ 8080 ];

  environment.systemPackages = with pkgs; [
    calibre
  ];
}
