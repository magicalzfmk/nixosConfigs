{ pkgs, ... }:

{
  # Enable Theme
  environment.variables.GTK_THEME = "dracula";
  environment.variables.XCURSOR_THEME = "posy-cursor";
  environment.variables.XCURSOR_SIZE = "12";
#  environment.variables.HYPRCURSOR_THEME = "Catppuccin-Macchiato-Teal";
#  environment.variables.HYPRCURSOR_SIZE = "24";
#  qt.enable = true;
#  qt.platformTheme = "gtk2";
#  qt.style = "gtk2";
#  console = {
#    earlySetup = true;
#    colors = [
#      "24273a"
#      "ed8796"
#      "a6da95"
#      "eed49f"
#      "8aadf4"
#      "f5bde6"
#      "8bd5ca"
#      "cad3f5"
#      "5b6078"
#      "ed8796"
#      "a6da95"
#      "eed49f"
#      "8aadf4"
#      "f5bde6"
#      "8bd5ca"
#      "a5adcb"
#    ];
#  };

  # Override packages
#  nixpkgs.config.packageOverrides = pkgs: {
#    colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = ["purple"]; };
#    catppuccin-gtk = pkgs.catppuccin-gtk.override {
#      accents = [ "purple" ]; # You can specify multiple accents here to output multiple themes 
#      size = "standard";
#      variant = "macchiato";
#    };
#    discord = pkgs.discord.override {
#      withOpenASAR = true;
#      withTTS = true;
#    };
#  };

  environment.systemPackages = with pkgs; [
#    numix-icon-theme-circle
    dracula-icon-theme
    posy-cursors
#    catppuccin-cursors.macchiatoTeal
    dracula-theme

    # gnome.gnome-tweaks
    # gnome.gnome-shell
    # gnome.gnome-shell-extensions
    # xsettingsd
    # themechanger
  ];
}
