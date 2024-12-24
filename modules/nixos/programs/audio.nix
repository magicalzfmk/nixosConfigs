{
  pkgs,
  inputs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    inputs.spicetify-nix.nixosModules.default
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  # Spicetify
  programs.spicetify = {
    enable = true;
    theme = lib.mkForce spicePkgs.themes.dracula;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      autoSkipVideo
      autoSkip
      betterGenres
      beautifulLyrics
      hidePodcasts
      keyboardShortcut
      loopyLoop
      #oneko
      popupLyrics
      playlistIcons
      skipOrPlayLikedSongs
      shuffle
      sectionMarker
      trashbin
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      reddit
      lyricsPlus
      marketplace
      localFiles
      ncsVisualizer
      #betterLibrary
    ];
    #    enabledSnippets = with spicePkgs.snippets; [
    #      rotating-coverart
    #      pointer
    #    ];
  };

  networking.firewall.allowedUDPPorts = [2234 2242];
  networking.firewall.allowedTCPPorts = [2234 2242];

  environment.systemPackages = with pkgs; [
    spotify
    spicetify-cli
    nicotine-plus
    lrcget
    youtube-music
  ];
}
