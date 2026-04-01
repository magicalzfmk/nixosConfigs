{
  flake.nixosModules.codingUtils = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vscodium
      alejandra
      git
      android-tools
    ];
  };

  flake.nixosModules.otherExtra = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # Gnome
      gvfs
      nautilus
      baobab

      # KDE
      nomacs
    ];
  };

  flake.nixosModules.desktopUtils = {pkgs, ...}: {
    # firewall ports: calibre1, calibre2
    networking.firewall.allowedTCPPorts = [8080 8081];
    networking.firewall.allowedUDPPorts = [8080 8081];

    # networking.firewall.allowedTCPPorts = [53317 8384 587 63197 44879];
    # networking.firewall.allowedUDPPorts = [53317 8384 587 63197 44879];

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
      ## System
      celluloid
      gnome-software
      flatpak
      librewolf

      ## User
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
      calibre
    ];
  };

  flake.nixosModules.extraUtils = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      fastfetch
      lf
      flameshot
      kdePackages.okular
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
