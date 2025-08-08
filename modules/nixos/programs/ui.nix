{
  pkgs,
  inputs,
  ...
}: {
  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Niri
  # programs.niri.enable = true;
  # security.polkit.enable = true; # polkit
  # services.gnome.gnome-keyring.enable = true; # secret service

  # Waybar
  programs.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    font-awesome

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

    # Niri Stuff
    # fuzzel
  ];
}
