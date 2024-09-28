{ pkgs, lib, inputs, ... }: 
{
  #lib.mkDefault
  #lib.mkForce
  
  stylix.enable = true;
  stylix.autoEnable = true;
  
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  #config.stylix.base16Scheme.base0E  To use somewhere
  
  stylix.image = /home/zfmk/Wallpapers/current.png;

  stylix.cursor.package = pkgs.nordzy-cursor-theme;
  stylix.cursor.name = "Nordzy-cursors";
  stylix.cursor.size = 12;
  
  #stylix.targets.pkgs.waybar.enable = false;
  #stylix.targets.rofi.enable = true;

  stylix.fonts = {
    sizes = {
      applications = 10;
      desktop = 10;
      popups = 10;
      terminal = 10;
    };
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
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

  stylix.polarity = "dark";

}
