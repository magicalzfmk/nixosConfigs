{ pkgs, lib, ... }: {
  imports = [
    ./audio.nix
    ./calibre.nix
    ./games.nix
    ./office.nix
    ./piracy.nix
    ./steam.nix
    ./ui.nix
    ./utilities.nix
    ./vm.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
