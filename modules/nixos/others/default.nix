{ pkgs, lib, ... }: {
  imports = [
    ./laptop.nix
    #./stylix.nix
    ./theme.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
