{ pkgs, lib, ... }: {
  imports = [
  
  ./others/stylix.nix
  
  ./services/os.nix
  ./services/nh.nix
  ./services/screenshot.nix
  ./services/others.nix
  ./services/utilities.nix
  ./services/hyprland.nix
  
  ./programs/utilities.nix
  ./programs/steam.nix
  ./programs/games.nix
  ./programs/development.nix
  ./programs/piracy.nix
  ./programs/audio.nix
  ./programs/ui.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
