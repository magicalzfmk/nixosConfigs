{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System
    celluloid
    gnome-software

    # Others
    freetube
    obsidian
    syncthing
    thunderbird
    chromium
  ];
}
