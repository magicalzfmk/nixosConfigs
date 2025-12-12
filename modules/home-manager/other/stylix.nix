{
  pkgs,
  lib,
  ...
}: {
  #lib.mkDefault
  #lib.mkDefault

  stylix = {
    enable = true;
    autoEnable = false;
    enableReleaseChecks = false;
    targets.vscode = {
      # enable = true;
      profileNames = ["Default"];
    };

    base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    #config.base16Scheme.base0E  To use somewhere

    # image = /Configs/images/current.png;a

    cursor = {
      package = lib.mkDefault pkgs.nordzy-cursor-theme;
      name = lib.mkDefault "Nordzy-cursors";
      size = lib.mkDefault 12;
    };

    targets = {
      alacritty.enable = true;
      # rofi.enable = true;
      gtk.enable = true;
      # kde.enable = true;
      # qt = {
      #   enable = true;
      #   platform = "dracula";
      # };
      gnome.enable = true;
      neovim.enable = true;
    };

    fonts = {
      sizes = {
        applications = 10;
        desktop = 10;
        popups = 10;
        terminal = 10;
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      monospace = {
        package = pkgs.cascadia-code;
        name = "Cascadia Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    polarity = "dark";
  };
}
