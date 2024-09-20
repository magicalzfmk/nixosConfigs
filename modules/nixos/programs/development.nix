{ config, pkgs, ... }:
{
  programs.adb.enable = true;

  users.users.zfmk = {
    extraGroups = [
      "adbusers"
    ];
  };

  environment.systemPackages = with pkgs; [
    android-studio
    vscode
    python312
    dart
    flutter
    android-tools
    clang
    cmake
    ninja
    pkg-config
  ];

}
