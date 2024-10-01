{ pkgs, lib, ... }: {
  imports = [
    ./autoActions.nix
    ./hyprland.nix
    ./nh.nix
    ./os.nix
    ./others.nix
    ./screenshot.nix
    ./utilities.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
