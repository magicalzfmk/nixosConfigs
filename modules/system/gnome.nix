# GNOME integration: GDM login manager and virtual filesystem (NixOS),
# plus dconf settings and shell extensions for the user session (Home-Manager).
{config, ...}: {
  flake.modules.nixos.gnome = {
    services = {
      xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
      displayManager.gdm.enable = true;
      gvfs.enable = true;
      printing.enable = true;
    };

    programs.dconf.enable = true;
  };

  flake.modules.homeManager.gnome = {pkgs, ...}: {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };
    };
  };
}
