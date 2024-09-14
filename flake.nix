{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
        ./modules/nixos
        ./modules/home-manager
      ];
    };

#    nixosConfigurations.test = nixpkgs.lib.nixosSystem {
#      specialArgs = {inherit inputs;};
#      modules = [
#        ./hosts/test/configuration.nix
#        inputs.home-manager.nixosModules.test
#      ];
#    };
  };
}

