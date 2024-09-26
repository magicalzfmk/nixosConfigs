{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix.url = "github:danth/stylix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
        ./modules/nixos
      ];
    };
    
    homeManagerModules.default = ./modules/home-manager;

    devShells.x86_64-linux.android =
      import ./shells/androidDev.nix { inherit pkgs; };

    devShells.x86_64-linux.test =
      import ./shells/test.nix { inherit pkgs; };
  };
}

