{ config, pkgs, ... }:
{
#  programs.ddnet.enable = true;
  
  # Bluetooth
  hardware.bluetooth= {
    enable = true;
    package = pkgs.bluez;
    input = {
      General = {
        #ClassicBondedOnly = false;
      };
    };
  };
  # hardware.opengl has beed changed to hardware.graphics

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
