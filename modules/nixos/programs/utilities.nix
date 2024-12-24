{pkgs, ...}: {
  # ports: localsend ? syncthing
  networking.firewall.allowedUDPPorts = [53317 8080 8384 587];
  networking.firewall.allowedTCPPorts = [53317 8080 8384 587];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    # System
    celluloid
    gnome-software

    # Others
    freetube #Youtube for Chads
    obsidian #Best Note Taking App
    syncthing #Sync between each app
    anki #Cool flashcard app
    thunderbird #Best mail client .
    chromium #For Uni stuff
    qbittorrent #Awesome torrent app
    stremio #Easy to implement (You know what)
    localsend #Cool one time share software

    # Office
    libreoffice

    # Calibre
    calibre
    # (oldPkgs.calibre.override {
    #   unrarSupport = true;
    # })
  ];
}
