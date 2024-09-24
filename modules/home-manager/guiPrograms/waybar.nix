{ pkgs, ... }:
#let
#  jsonContent = builtins.readFile "/home/zfmk/Configs/modules/home-manager/guiPrograms/waybar.jsonc";
#  cssContent = builtins.readFile "/home/zfmk/Configs/modules/home-manager/guiPrograms/waybar.css";
#in
{
  

  environment.systemPackages = with pkgs; [
    
  ];
}
