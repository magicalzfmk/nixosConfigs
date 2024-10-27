{ config, pkgs, lib, ... }:
let
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "$FLAKE/otherConfigs/alacritty/dracula.toml"
      ];
      
    };
  };
}
