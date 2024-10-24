{ config, pkgs, inputs, ... }:
{
  imports = [ # Include the results of the hardware scan.
    inputs.home-manager.nixosModules.default
  ];


  home-manager = {
    sharedModules = [
      inputs.self.outputs.homeManagerModules.default
    ];
    backupFileExtension = "old";
    extraSpecialArgs = { inherit inputs; };
    #useGlobalPkgs = true;
    #useUserPackages = true;
    users = {
      zfmk = import ./home.nix;
    };
  };
}
