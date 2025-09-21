{
  pkgs,
  lib,
  ...
}: {
  # Permissions
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode.enable = true;
  };

  # Unfree Packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  # Open Ports
  networking.firewall = {
    # Steam ports
    allowedTCPPorts = [27015 27016];
    allowedUDPPorts = [3478 4379 4380];
  };

  # Packages
  environment.systemPackages = with pkgs; [
    # Steam Stuff
    steam-run

    # Other Stuff
    protonup-qt
    mangohud
    (pkgs.bottles.override {removeWarningPopup = true;})
    lutris
    ludusavi

    # Emulation
    # retroarch
    # rpcs3

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
