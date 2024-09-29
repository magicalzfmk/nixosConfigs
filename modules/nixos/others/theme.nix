{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dracula-theme
    nordzy-cursor-theme
    dracula-icon-theme
  ];
}
