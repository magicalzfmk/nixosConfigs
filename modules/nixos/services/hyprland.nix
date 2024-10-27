{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    mako
    dunst
    libnotify
    swww
    alacritty
    rofi-wayland
    networkmanagerapplet
    ags
  ];
}
