{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    mako
    dunst
    libnotify
    swww
    rofi-wayland
    networkmanagerapplet
    ags

    # Hyprland Ecosystem
    hyprlock
    hypridle
    hyprpaper
  ];
}
