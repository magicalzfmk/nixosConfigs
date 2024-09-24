{ config, pkgs, inputs, ... }:
{
  # Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  
  # Waybar
  programs.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
  ];
}
