# Niri scrollable-tiling compositor: system enable (NixOS) and
# user config file via XDG (Home-Manager).
{config, ...}: {
  flake.modules.nixos.niri = {pkgs, ...}: {
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [fuzzel];
  };

  flake.modules.homeManager.niri = {
    xdg.configFile."niri/config.kdl".source = ./_niri/config.kdl;
  };
}
