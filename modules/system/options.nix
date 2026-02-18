# Defines the custom flake.modules option that is the backbone of the Dendritic pattern.
# Each feature module sets flake.modules.nixos.<feature> and/or
# flake.modules.homeManager.<feature>, which are then consumed by hosts.nix.
{lib, ...}: {
  options.flake.modules = {
    nixos = lib.mkOption {
      type = lib.types.attrsOf lib.types.unspecified;
      default = {};
      description = "NixOS module fragments keyed by feature name.";
    };

    homeManager = lib.mkOption {
      type = lib.types.attrsOf lib.types.unspecified;
      default = {};
      description = "Home-Manager module fragments keyed by feature name.";
    };
  };
}
