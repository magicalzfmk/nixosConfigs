{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = builtins.fromJSON  builtins.readFile ./waybar.jsonc;
    style = builtins.readFile ./waybar.css;
  };

  environment.systemPackages = with pkgs; [
    waybar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
  ];
}
