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
    flatpak
    gnome-software

    # Others
    obsidian #Best Note Taking App
    syncthing #Sync between each app
    anki #Cool flashcard app
    thunderbird #Best mail client.
    chromium #For Uni stuff
    qbittorrent #Awesome torrent app
    localsend #Cool one time share software

    # Video
    freetube #Youtube for Chads
    stremio #Easy to implement (You know what)
    miru

    # Office
    libreoffice

    # Book
    calibre
    # (oldPkgs.calibre.override {
    #   unrarSupport = true;
    # })
  ];
}
