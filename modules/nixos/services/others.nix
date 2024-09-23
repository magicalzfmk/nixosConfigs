{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    # Window Prompt Input Creator
    zenity


  ];
}
