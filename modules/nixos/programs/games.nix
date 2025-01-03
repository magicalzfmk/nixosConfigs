{
  pkgs,
  pkgsStable,
  lib,
  ...
}: {
  # Permissions
  programs = {
    steam = {
      enable = true;
      # Missing Dependencies
      #package = pkgs.steam.override { withJava = true; };
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

      gamescopeSession.enable = true;
    };

    gamemode.enable = true;
  };

  # Unfree Packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
    ];

  # Open Ports
  networking.firewall = {
    allowedTCPPorts = [27015 27016]; # Add other ports as necessary
    allowedUDPPorts = [3478 4379 4380]; # Add other ports as necessary
  };

  # Packages
  environment.systemPackages = with pkgs; [
    # Steam Stuff
    steam
    gamescope
    gamemode

    # Other Stuff
    protonup-qt
    mangohud
    pkgsStable.bottles
    lutris

    # Wine Stuff
    wineWowPackages.waylandFull
    winetricks

    # Actual Games
    osu-lazer-bin
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
