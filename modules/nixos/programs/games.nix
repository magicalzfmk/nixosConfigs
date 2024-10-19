{ config, pkgs, ... }:
{
#  programs.ddnet.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-qt
    mangohud
    bottles
    lutris
    wine
  ];

  #protonup settings
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

}
