{ config, pkgs, lib, ... }:
let
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "../../other configs/alacritty/dracula.toml"
      ];
      
      
    };
  };
}
