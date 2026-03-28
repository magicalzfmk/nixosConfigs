{
  flake.nixosModules.codingUtils = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vscodium
      alejandra
      git
      android-tools
    ];
  };

  flake.nixosModules.gnomeExtra = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      gvfs
      nautilus
      baobab
    ];
  };

  flake.nixosModules.desktopUtils = {pkgs, ...}: {
    # Misc firewall ports (localsend, calibre, syncthing, qbittorrent, simplex)
    # networking.firewall.allowedTCPPorts = [53317 8080 8081 8384 587 63197 44879];
    # networking.firewall.allowedUDPPorts = [53317 8080 8081 8384 587 63197 44879];

    programs = {
      localsend = {
        enable = true;
        openFirewall = true;
      };
      nautilus-open-any-terminal = {
        enable = true;
        terminal = "alacritty";
      };
    };

    services = {
      udisks2.enable = true;
      blueman.enable = true;
    };

    environment.systemPackages = with pkgs; [
      # Audio
      nicotine-plus
      lrcget
      picard
      pavucontrol

      # Desktop / apps
      nomacs
      kdePackages.okular
      celluloid
      gnome-software
      flatpak
      librewolf
      obsidian
      syncthing
      thunderbird
      chromium
      qbittorrent
      pdfarranger
      zapzap
      materialgram
      krita
      czkawka
      imgbrd-grabber
    ];
  };

  flake.nixosModules.extraUtils = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      fastfetch
      lf
      flameshot
    ];
  };

  flake.nixosModules.niriUtils = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # Screenshot
      textsnatcher
      grim
      wl-clipboard
      swappy
      slurp

      # apps/services
      brightnessctl
      xwayland-satellite
    ];
  };
}
