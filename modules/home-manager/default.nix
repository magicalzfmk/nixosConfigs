{ config, pkgs, ... }:

{
  imports = [
    ./guiPrograms/hyprland.nix
    ./guiPrograms/waybar.nix
    ./guiPrograms/alacritty.nix
    ./guiPrograms/others.nix
  ];
}
