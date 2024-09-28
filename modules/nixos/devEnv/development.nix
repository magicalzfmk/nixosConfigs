{ config, pkgs, ... }:
{
  programs.adb.enable = true;
  programs.java.enable = true; 

  users.users.zfmk = {
    extraGroups = [
      "adbusers"
    ];
  };
  
  environment.sessionVariables = {
    #PATH = "~/development/flutter/bin:$PATH";
    #ANDROID_HOME = "~/Android/Sdk";
    #ANDROID_AVD_HOME = "~/.android/avd";
  };
  
  networking.firewall.allowedTCPPorts = [ 5037 ];
  networking.firewall.allowedUDPPorts = [ 5037 ];

  environment.systemPackages = with pkgs; [
    vscode
    android-tools
    unzip
  ];

}
