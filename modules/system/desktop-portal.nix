# XDG desktop portal — required for screen sharing and GTK app theming on Wayland.
{config, ...}: {
  flake.modules.nixos.desktop-portal = {pkgs, ...}: {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };
}
