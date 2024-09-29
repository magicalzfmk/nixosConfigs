{ config, pkgs, ... }:
{
  #programs.peazip.enable = true;

#  networking.firewall.allowedUDPPorts = [ 2234 2242 ];
#  networking.firewall.allowedTCPPorts = [ 2234 2242 ];

  environment.systemPackages = with pkgs; [
    libreoffice
  ];
}
