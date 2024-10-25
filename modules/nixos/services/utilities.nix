{ config, pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  
  hardware.opentabletdriver.enable = true;
  
  environment.systemPackages = with pkgs; [
    git
    pandoc
    neofetch
    lf
    neovim
    brightnessctl
  ];
}
