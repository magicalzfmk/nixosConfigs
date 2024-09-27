{ pkgs, ... }: 

{
  stylix.enable = true;
  stylix.autoEnable = true;
  
  stylix.homeManagerIntegration.autoImport = true;
  stylix.homeManagerIntegration.followSystem = true;
  
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  
  stylix.image = /home/zfmk/Wallpapers/current.png;

  stylix.cursor.package = pkgs.nordzy-cursor-theme;
  stylix.cursor.name = "Nordzy-cursors";
  stylix.cursor.size = 12;

  stylix.fonts = {
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