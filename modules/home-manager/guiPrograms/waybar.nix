{ pkgs, ... }:
#let
#  jsonContent = builtins.readFile "/home/zfmk/Configs/modules/home-manager/guiPrograms/waybar.jsonc";
#  cssContent = builtins.readFile "/home/zfmk/Configs/modules/home-manager/guiPrograms/waybar.css";
#in
{
  programs.waybar = {
    enable = true;
#    settings = jsonContent;
#    style = cssContent;
  };

  environment.systemPackages = with pkgs; [
    waybar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
  ];
}
