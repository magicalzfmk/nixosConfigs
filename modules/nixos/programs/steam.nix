{ config, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  networking.firewall.allowedTCPPorts = [ 27015 27016 ]; # Add other ports as necessary
  networking.firewall.allowedUDPPorts = [ 3478 4379 4380 ]; # Add other ports as necessary

  environment.systemPackages = with pkgs; [
    steam
  ];
}
