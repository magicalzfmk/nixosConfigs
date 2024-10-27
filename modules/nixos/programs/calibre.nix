{stablePkgs, ...}: {
  #programs.calibre.enable = true;

  networking.firewall.allowedUDPPorts = [8080];
  networking.firewall.allowedTCPPorts = [8080];

  environment.systemPackages = with stablePkgs; [
    calibre
  ];
}
