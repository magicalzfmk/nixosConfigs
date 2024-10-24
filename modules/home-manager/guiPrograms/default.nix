{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./alacritty.nix
    ./others.nix
  ];
}
