{ config, pkgs, ... }:
{
  users.users.zfmk.extraGroups = [ "kvm" ];
  
  #environment.sessionVariables = {
  #  #PATH = "~/development/flutter/bin:$PATH";
  #};
  
  #networking.firewall.allowedTCPPorts = [ 5037 ];
  #networking.firewall.allowedUDPPorts = [ 5037 ];
  
  environment.sessionVariables = rec {
    PATH = [
      "~/development/flutter/bin"
    ];
  };

  environment.systemPackages = with pkgs; [
    android-studio
    #flutter
    clang
    ninja
    pkg-config
    gtk3
    pcre
    epoxy
  ];

}
