{pkgs, ...}: {
  networking.firewall.allowedUDPPorts = [53317];
  networking.firewall.allowedTCPPorts = [53317];

  environment.systemPackages = with pkgs; [
    # System
    celluloid
    stremio
    gnome-software

    # Others
    freetube
    obsidian
    syncthing
    anki
    krita
    thunderbird
    chromium
  ];
}
