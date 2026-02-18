# Gaming setup: Steam with remote play and dedicated server firewall rules,
# Gamescope + Gamemode for performance, and a curated set of gaming tools.
{config, ...}: {
  flake.modules.nixos.games = {
    pkgs,
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
        capSysNice = true;
      };
      gamemode.enable = true;
    };

    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ];

    networking.firewall = {
      allowedTCPPorts = [27015 27016];
      allowedUDPPorts = [3478 4379 4380];
    };

    environment.systemPackages = with pkgs; [
      steam-run
      protonplus
      mangohud
      (pkgs.bottles.override {removeWarningPopup = true;})
      itch
      ludusavi

      # Wine
      winetricks
      wine-wayland

      # Games
      osu-lazer-bin
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
