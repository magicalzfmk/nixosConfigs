{...}: {
  imports = [
    ./laptop.nix
    #./stylix.nix
    ./theme.nix
    ./gnome.nix
  ];

  #  module2.enable = lib.mkDefault true;
  #  module3.enable = false;
}
