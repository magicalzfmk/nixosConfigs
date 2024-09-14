{ config, pkgs, ... }:
{
#  programs.ddnet.enable = true;

  environment.systemPackages = with pkgs; [
    android-studio
    vscode
    python312
    
  ];

}
