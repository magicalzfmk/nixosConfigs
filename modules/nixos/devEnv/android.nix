{pkgs, ...}: {
  users.users.zfmk.extraGroups = ["kvm"];

  #networking.firewall.allowedTCPPorts = [ 5037 ];
  #networking.firewall.allowedUDPPortCHROME_EXECUTABLEs = [ 5037 ];

  environment.variables = {
    PATH = [
      "~/Development/flutter/bin"
    ];
    CHROME_EXECUTABLE = "${pkgs.chromium}";
  };

  environment.systemPackages = with pkgs; [
    # android-studio
    # flutter
    # dart
    clang
    ninja
    pkg-config
    gtk3
    pcre
    libepoxy
  ];
}
