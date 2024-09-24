{ pkgs, lib, ... }: {
  imports = [
  
  ./others/stylix.nix
  
  ./services/nh.nix
  ./services/screenshot.nix
  ./services/others.nix
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
