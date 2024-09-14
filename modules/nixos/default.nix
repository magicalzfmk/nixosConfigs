{ pkgs, lib, ... }: {
  imports = [
  ./services/nh.nix
  ./services/screenshot.nix
  ./programs/steam.nix
  ./programs/games.nix
  ./programs/development.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
