{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System
    celluloid
    stremio
    gnome-software

    # Others
    freetube
    obsidian
    syncthing
    thunderbird
    chromium
  ];
}
