{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dracula-theme
    nordzy-cursor-theme
    dracula-icon-theme
    #cascadia-code
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    dejavu_fonts
    cascadia-code
  ];

  # Allow Flatpaks to see system fonts
  #fonts.fontDir.enable = true;

  # KDE-GNOME desktop integration
  #qt = {
  #  enable = true;
  #  platformTheme = "gnome";
  #  style = "adwaita-dark";
  #};
}
#qt = {
#  enable = true;
#  platformTheme = "qtct";
#  style.name = "kvantum";
#};
#xdg.configFile = {
#  "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
#  "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=ArcDark";
#};

