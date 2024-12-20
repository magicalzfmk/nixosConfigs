{pkgs, ...}: {
  users.users.zfmk.extraGroups = ["kvm"];

  #networking.firewall.allowedTCPPorts = [ 5037 ];
  #networking.firewall.allowedUDPPorts = [ 5037 ];

  environment.variables = {
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
    libepoxy
  ];
}
