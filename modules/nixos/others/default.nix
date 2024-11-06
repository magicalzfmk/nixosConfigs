{...}: {
  imports = [
    ./laptop.nix
    # ./stylix.nix
    ./theme.nix
    ./gnome.nix
    # ./kde.nix # Use PLASMA desktop
  ];

  #  module2.enable = lib.mkDefault true;
  #  module3.enable = false;
}
