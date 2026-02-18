# Desktop notification daemon: mako installed system-wide (NixOS) and
# configured as a Home-Manager service with Dracula-friendly defaults.
{config, ...}: {
  flake.modules.nixos.notifications = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [mako dunst libnotify];
  };

  flake.modules.homeManager.notifications = {
    services.mako = {
      enable = true;
      settings = {
        anchor = "top-right";
        defaultTimeout = 600;
      };
    };
  };
}
