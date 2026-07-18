{
  flake.nixosModules.games = {
    pkgs,
    spkgs,
    lib,
    ...
  }: {
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
        # capSysNice = true;
      };
      gamemode.enable = true;
    };

    networking.firewall = {
      allowedTCPPorts = [27015 27016];
      allowedUDPPorts = [3478 4379 4380];
    };

    environment.systemPackages = with pkgs; [
      heroic
      steam-run
      protonplus
      mangohud
      (spkgs.bottles.override {removeWarningPopup = true;})
      itch
      ludusavi

      # Wine
      winetricks
      wine-wayland

      # Games
      osu-lazer-bin
      ddnet
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
