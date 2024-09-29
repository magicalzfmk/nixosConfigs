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
    system = "x86_64-linux";
    pkgs = import nixpkgs{
      inherit system;
      config = {
        android_sdk.accept_license = true;
        allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs pkgs system;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.default
        ./modules/nixos
      ];
    };
    
    homeManagerModules.default = ./modules/home-manager;
    
    #homeConfigurations.zfmk = home-manager.lib.homeManagerConfiguration {
    #  inherit pkgs;
    #  modules = [
    #    ./hosts/default/home.nix
    #  ];
    #};

    devShells.x86_64-linux.android =
      import ./shells/androidDev.nix { inherit pkgs; };

    devShells.x86_64-linux.test =
      import ./shells/test.nix { inherit pkgs; };
  };
}

