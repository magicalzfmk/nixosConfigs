{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    textsnatcher
  ];
}
