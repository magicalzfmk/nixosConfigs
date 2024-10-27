{pkgs, ...}: {
  #networking.firewall.allowedUDPPorts = [ 53317 ];
  #networking.firewall.allowedTCPPorts = [ 53317 ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    localsend
  ];
}
