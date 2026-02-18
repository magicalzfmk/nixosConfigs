# Visual theming closure: system fonts & icon packages (NixOS) and
# Stylix declarative theming (Home-Manager). Both sides share the Dracula palette.
{config, ...}: {
  # ── NixOS side: install theme + font packages system-wide ────────
  flake.modules.nixos.theming = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      dracula-theme
      nordzy-cursor-theme
      dracula-icon-theme
    ];

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      dejavu_fonts
      cascadia-code
    ];
  };

  # ── Home-Manager side: Stylix declarative theming ─────────────────
  flake.modules.homeManager.theming = {
    pkgs,
    lib,
    ...
  }: {
    stylix = {
      enable = true;
      autoEnable = false;
      enableReleaseChecks = false;

      base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/dracula.yaml";
      polarity = "dark";

      cursor = {
        package = lib.mkDefault pkgs.nordzy-cursor-theme;
        name = lib.mkDefault "Nordzy-cursors";
        size = lib.mkDefault 12;
      };

      targets = {
        alacritty.enable = true;
        gtk.enable = true;
        gnome.enable = true;
        neovim.enable = true;
        vscode.profileNames = ["Default"];
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
    };
  };
}
