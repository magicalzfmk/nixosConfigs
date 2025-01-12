{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Most of stuff is from vimjoyer's video
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
    # hyprpaper
  ];
}
