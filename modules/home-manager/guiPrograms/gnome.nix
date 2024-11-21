{pkgs, ...}: {
  # gtk = {
    # enable = true;
    # theme.name = lib.mkForce "Dracula";
    # cursorTheme.name = lib.mkForce "Nordzy-cursors";
    # iconTheme.name = lib.mkForce "Dracula";
  # };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          gsconnect.extensionUuid
        ];
      };
    };
  };
}
