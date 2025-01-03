{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stablepkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    stylix.url = "github:danth/stylix";

    hyprland.url = "github:/hyprwm/Hyprland";
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
    stablepkgs,
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
    pkgsStable = import stablepkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs pkgs pkgsStable system;};
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

    devShells.x86_64-linux.flashpoint =
      import ./shells/flashpoint.nix {inherit pkgs;};
  };
}
