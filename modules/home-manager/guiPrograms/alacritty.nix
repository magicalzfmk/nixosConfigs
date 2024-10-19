{ config, pkgs, lib, ... }:
let
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "$FLAKE/other configs/alacritty/dracula.toml"
      ];
      
    };
  };
}
