{ pkgs, lib, ... }: 
{
  stylix.enable = lib.mkDefault true;
  stylix.autoEnable = lib.mkDefault true;
  
  stylix.base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  
  stylix.image = lib.mkDefault /home/zfmk/Wallpapers/current.png;

  stylix.cursor.package = lib.mkDefault pkgs.nordzy-cursor-theme;
  stylix.cursor.name = lib.mkDefault "Nordzy-cursors";
  stylix.cursor.size = lib.mkDefault 12;
  
  #stylix.targets.pkgs.waybar.enable = false;
  #stylix.targets.rofi.enable = true;
  
  home-manager = {
    sharedModules = [{
      stylix.targets.waybar.enable = false;
    }];
  };

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
