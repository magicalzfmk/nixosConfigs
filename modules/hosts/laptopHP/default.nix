{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.laptopHP = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      # Modules
      laptopHPConfig
      laptopHPHardware
      zfmk
      niri
      flatpak
      games
      neovim
      nh
      theming
      terminal
      # vm

      # Utilities
      desktopUtils
      codingUtils
      extraUtils
      niriUtils

      # Home Modules
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          # useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs self;};
          sharedModules = [inputs.stylix.homeModules.stylix];
          users.zfmk = {
            imports = with self.homeModules; [
              zfmk
              git
              neovim
              theming
              terminal
            ];
          };
        };
      }
    ];
  };
}
