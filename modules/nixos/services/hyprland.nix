{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    mako
    dunst
    libnotify
    swww
    alacritty
    rofi-wayland
    networkmanagerapplet
    ags
  ];
}
