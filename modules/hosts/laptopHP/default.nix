{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.laptopHP = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      spkgs = import inputs.stablepkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    };
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
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs self;
            spkgs = import inputs.stablepkgs {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
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
