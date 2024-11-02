{
  pkgs,
  lib,
  ...
}: {
  #lib.mkDefault
  #lib.mkForce

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    #config.base16Scheme.base0E  To use somewhere

    image = ../../../images/current.png;

    cursor = {
      package = lib.mkForce pkgs.nordzy-cursor-theme;
      name = lib.mkForce "Nordzy-cursors";
      size = lib.mkForce 12;
    };

    #targets.pkgs.waybar.enable = false;
    #targets.rofi.enable = true;

    #targets.gtk.enable = true;
    #targets.gnome.enable = true;

    fonts = {
      sizes = {
        applications = 10;
        desktop = 10;
        popups = 10;
        terminal = 10;
      };
      monospace = {
        package = pkgs.cascadia-code;
        name = "Cascadia Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    polarity = "dark";
  };
}
