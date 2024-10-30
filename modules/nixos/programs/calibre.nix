{pkgs, ...}: {
  #programs.calibre.enable = true;

  networking.firewall.allowedUDPPorts = [8080];
  networking.firewall.allowedTCPPorts = [8080];

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    (calibre.override {
      unrarSupport = true;
    })
  ];
}
