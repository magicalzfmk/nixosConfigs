{ pkgs, lib, ... }: {
  imports = [
    ./others/stylix.nix
    ./guiPrograms/waybar.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
