{ config, pkgs, ... }:

{
  imports = [
    ./guiPrograms/hyprland.nix
    ./guiPrograms/waybar.nix
    ../nixos/others/stylix.nix
  ];
  
}
