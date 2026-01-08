{pkgs, ...}: {
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
    android-tools

    # Game Dev
    # aseprite
    # famistudio
    # godot_4
  ];
}
