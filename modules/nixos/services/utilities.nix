{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    pandoc
    neofetch
    lf
    neovim
    brightnessctl
  ];
}
