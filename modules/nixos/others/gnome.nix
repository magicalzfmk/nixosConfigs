{pkgs, ...}: {
  systemd.services = {
    # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };

  services = {
    # Enable the GNOME Desktop Environment.
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    # gnome-tour
    # gnome-connections
    epiphany # web browser
    geary # email reader
  ];

  # environment.systemPackages = with pkgs.gnomeExtensions; [
  #   blur-my-shell
  #   pop-shell
  # ];

  services.gvfs.enable = true;
  # services.sysprof.enable = true;

  #nixpkgs.overlays = [(self: super: {
  #  gnome = super.gnome.overrideScope' (gself: gsuper: {
  #    nautilus = gsuper.nautilus.overrideAttrs (nsuper: {
  #      buildInputs = nsuper.buildInputs ++ (with gst_all_1; [
  #        gst-plugins-good
  #        gst-plugins-bad
  #      ]);
  #    });
  #  });
  #})];

  #nixpkgs.config.allowAliases = false;

  # nixpkgs.overlays = [
  #   # GNOME 46: triple-buffering-v4-46
  #   (final: prev: {
  #     gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
  #       mutter = gnomePrev.mutter.overrideAttrs (old: {
  #         src = pkgs.fetchFromGitLab {
  #           domain = "gitlab.gnome.org";
  #           owner = "vanvugt";
  #           repo = "mutter";
  #           rev = "triple-buffering-v4-46";
  #           hash = "sha256-fkPjB/5DPBX06t7yj0Rb3UEuu5b9mu3aS+jhH18+lpI=";
  #         };
  #       });
  #     });
  #   })
  # ];
}
