{pkgs, ...}: {
  # ports: localsend calibre1 calibre2 syncthing ?
  networking.firewall.allowedUDPPorts = [53317 8080 8081 8384 587];
  networking.firewall.allowedTCPPorts = [53317 8080 8081 8384 587];

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
    librewolf

    # Others
    obsidian #Best Note Taking App
    syncthing #Sync between each app
    anki #Cool flashcard app
    thunderbird #Best mail client.
    chromium #For Uni stuff
    qbittorrent #Awesome torrent app
    localsend #Cool one time share software
    pdfarranger
    zapzap
    materialgram

    # Book
    calibre
    # (oldPkgs.calibre.override {
    #   unrarSupport = true;
    # })
  ];
}
