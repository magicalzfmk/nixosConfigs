{pkgs, ...}: {
  # ports: localsend calibre1 calibre2 syncthing ? qbittorrent simplex
  networking.firewall.allowedUDPPorts = [53317 8080 8081 8384 587 63197 44879];
  networking.firewall.allowedTCPPorts = [53317 8080 8081 8384 587 63197 44879];

  programs = {
    localsend = {
      enable = true;
      openFirewall = true;
    };

    nautilus-open-any-terminal = {
      enable = true;
      terminal = "alacritty";
    };

    # spacefm = {
    #   enable = true;
    # };
  };

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    # System
    nautilus #File Manager
    baobab #Disk usage
    loupe #Image viewer
    papers #Document viewer
    celluloid
    flatpak
    gnome-software
    librewolf
    onlyoffice-desktopeditors

    # Others
    obsidian #Best Note Taking App
    syncthing #Sync between each app
    # anki #Cool flashcard app
    thunderbird #Best mail client.
    chromium #For Uni stuff
    qbittorrent #Awesome torrent app
    localsend #Cool one time share software
    pdfarranger
    zapzap
    materialgram
    krita
  ];
}
