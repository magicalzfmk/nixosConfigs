# General-purpose utilities: CLI tools, file managers, productivity apps,
# screenshot tools, and misc system packages. Also opens ports used by
# Localsend, Calibre, Syncthing, etc.
{config, ...}: {
  flake.modules.nixos.utilities = {pkgs, ...}: {
    # Misc firewall ports (localsend, calibre, syncthing, qbittorrent, simplex)
    networking.firewall.allowedTCPPorts = [53317 8080 8081 8384 587 63197 44879];
    networking.firewall.allowedUDPPorts = [53317 8080 8081 8384 587 63197 44879];

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

    services.udisks2.enable = true;

    environment.systemPackages = with pkgs; [
      # CLI
      git
      neofetch
      lf
      cmake
      clang-tools
      polkit
      pandoc
      ffmpeg_6
      statix
      zenity

      # Desktop / apps
      nautilus
      baobab
      loupe
      papers
      celluloid
      flatpak
      gnome-software
      librewolf
      onlyoffice-desktopeditors
      gparted
      obsidian
      syncthing
      thunderbird
      chromium
      qbittorrent
      localsend
      pdfarranger
      zapzap
      materialgram
      krita
      czkawka

      # Wayland / Display
      swww
      rofi
      networkmanagerapplet
      brightnessctl
      gvfs
      blueberry
      ags

      # Screenshot
      grim
      slurp
      wl-clipboard
      textsnatcher
      flameshot
      wlroots
    ];
  };
}
