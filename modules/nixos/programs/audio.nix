{ config, pkgs, inputs, ... }:
{
#  programs.nicotine-plus.enable = true;
  # Spicetify
  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    enable = true;
    theme = spicePkgs.themes.dracula;
    
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
  
  networking.firewall.allowedUDPPorts = [ 2234 2242 ];
  networking.firewall.allowedTCPPorts = [ 2234 2242 ];

  environment.systemPackages = with pkgs; [
    spotify
    spicetify-cli
    nicotine-plus
  ];
}
