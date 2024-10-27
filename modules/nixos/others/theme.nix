{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dracula-theme
    nordzy-cursor-theme
    dracula-icon-theme
  ];

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

