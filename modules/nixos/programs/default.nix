{ pkgs, lib, ... }: {
  imports = [
    ./utilities.nix
    ./steam.nix
    ./games.nix
    ./piracy.nix
    ./audio.nix
    ./ui.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
