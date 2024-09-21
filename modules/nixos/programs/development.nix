{ config, pkgs, ... }:
{
  programs.adb.enable = true;
  programs.java.enable = true; 

  users.users.zfmk = {
    extraGroups = [
      "adbusers"
    ];
  };

  environment.systemPackages = with pkgs; [
    vscode
    android-tools
    unzip
  ];

}
