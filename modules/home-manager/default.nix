{ pkgs, lib, ... }: {
  imports = [
    ./others/theme.nix
    ./guiPrograms/waybar.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
