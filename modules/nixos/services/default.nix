{ pkgs, lib, ... }: {
  imports = [
    ./os.nix
    ./nh.nix
    ./screenshot.nix
    ./others.nix
    ./utilities.nix
    ./hyprland.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
