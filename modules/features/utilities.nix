{config, ...}: {
  flake.nixosModules.utilities = {pkgs, ...}: {
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
      # Coding
      vscodium
      alejandra
      git
      android-tools
      fastfetch
      lf

      # Audio
      nicotine-plus
      lrcget
      picard
      pavucontrol

      # Desktop / apps
      nautilus
      baobab
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
      brightnessctl

      # Wayland / Display
      rofi
      gvfs

      # Screenshot
      textsnatcher
      flameshot
      grim
      wl-clipboard
      swappy
      slurp
    ];
  };
}
