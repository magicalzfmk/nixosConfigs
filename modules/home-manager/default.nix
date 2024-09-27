{ config, pkgs, ... }:

{
  imports = [
    ./guiPrograms/hyprland.nix
    ./guiPrograms/waybar.nix
  ];
  
}
