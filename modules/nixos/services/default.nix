{...}: {
  imports = [
    ./autoActions.nix
    #./homeManager.nix # Used for home-manager as a module
    ./hyprland.nix
    ./nh.nix
    ./utilities.nix
  ];

  #  module2.enable = lib.mkDefault true;
  #  module3.enable = false;
}
