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
    # firewall ports: calibre1, calibre2, qbittorrent
    networking.firewall.allowedTCPPorts = [8080 8081 59973];
    networking.firewall.allowedUDPPorts = [8080 8081 59973];

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

    hardware = {
      opentabletdriver.enable = true;
      uinput.enable = true;
    };

    boot.kernelModules = ["uinput"];

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
      materialgram
      krita
      czkawka
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
