# The only place that knows about specific machines / users.
# Picks which feature modules to include in each configuration.
{
  inputs,
  config,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
  };

  # Convenience: grab all collected nixos/homeManager feature modules.
  nixosMods = config.flake.modules.nixos;
  homeMods = config.flake.modules.homeManager;
in {
  systems = ["x86_64-linux"];

  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = with nixosMods; [
      system-base
      hardware
      networking
      user
      audio
      flatpak
      desktop-portal
      gnome
      theming
      terminal
      neovim
      hyprland
      hypr-ecosystem
      waybar
      niri
      browser
      games
      vm
      dev-tools
      utilities
      notifications
      nh
      git # system-level git (optional, remove if preferred only in home)
    ];
  };

  flake.homeConfigurations.zfmk = inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules =
      (with homeMods; [
        user
        theming
        terminal
        neovim
        hyprland
        hypr-ecosystem
        waybar
        gnome
        notifications
        git
        vscode
        niri
      ])
      ++ [
        inputs.stylix.homeModules.stylix
      ];
  };

  # Dev shells are perSystem outputs — kept alongside the modules naturally.
  perSystem = {pkgs, ...}: {
    devShells = {
      android = import ./_shells/androidDev.nix {inherit pkgs;};
      test = import ./_shells/test.nix {inherit pkgs;};
      flashpoint = import ./_shells/flashpoint.nix {inherit pkgs;};
    };
  };
}
