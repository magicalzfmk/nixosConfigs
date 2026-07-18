{
  flake.nixosModules.codingUtils = {pkgs, ...}: {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
    };

    environment.systemPackages = with pkgs; [
      vscodium
      alejandra
      git
      android-tools
      devenv
    ];
  };

  flake.nixosModules.gameDevUtils = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      godot
      aseprite
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
    # firewall ports: calibre1, calibre2, qbittorrent, nicotine
    networking.firewall.allowedTCPPorts = [8080 8081 59973 2234];
    networking.firewall.allowedUDPPorts = [8080 8081 59973 2234];

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

      ## System
      celluloid
      gnome-software
      flatpak

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
