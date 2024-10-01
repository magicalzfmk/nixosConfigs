{ config, pkgs, inputs, ... }:
{
  # nh clean enabled
  #nix.gc = {
  #  automatic = true;
  #  dates = "weekly";
  #  options = "--delete-older-than 1w";
  #}; 
  
  nix.settings.auto-optimise-store = true;
  
  environment.systemPackages = with pkgs; [
    
  ];
}
