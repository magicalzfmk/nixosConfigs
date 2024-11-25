{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pkgs_old.url = "github:nixos/nixpkgs/nixos-24.05";

    stylix.url = "github:danth/stylix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland";
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

    # Nvim Dracula Plugin
    plugin-dracula = {
      url = "github:Mofiqul/dracula.nvim";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    pkgs_old,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        android_sdk.accept_license = true;
        allowUnfree = true;
      };
    };

    oldPkgs = import pkgs_old {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs pkgs oldPkgs system;};
      modules = [
        ./hosts/default/configuration.nix
        ./modules/nixos

        # Home-Manager Modules
        #inputs.stylix.nixosModules.stylix
        #inputs.home-manager.nixosModules.default
      ];
    };

    #homeManagerModules.default = ./modules/home-manager;

    homeConfigurations.zfmk = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./hosts/default/home.nix
        ./modules/home-manager/default.nix
        stylix.homeManagerModules.stylix
      ];
    };

    devShells.x86_64-linux.android =
      import ./shells/androidDev.nix {inherit pkgs;};

    devShells.x86_64-linux.test =
      import ./shells/test.nix {inherit pkgs;};
  };
}
