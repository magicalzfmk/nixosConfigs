{pkgs, ...}: {
  #  programs.ddnet.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-qt
    mangohud
    bottles
    lutris
    
    wineWowPackages.waylandFull
    winetricks
  ];

  #protonup settings
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
