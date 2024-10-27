{ pkgs, ... }:
{  
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    textsnatcher
    (flameshot.override { enableWlrSupport = true; })
    wlroots
  ];
}
