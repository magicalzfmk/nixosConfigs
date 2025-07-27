{pkgs, ...}: {
  programs.adb.enable = true;
  programs.java.enable = true;

  users.users.zfmk = {
    extraGroups = [
      "adbusers"
    ];
  };

  # vscode?
  networking.firewall.allowedTCPPorts = [5037];
  networking.firewall.allowedUDPPorts = [5037];

  environment.systemPackages = with pkgs; [
    vscodium
    android-tools
    unzip

    # Game Dev
    # aseprite
    # famistudio
    # godot_4
  ];
}
