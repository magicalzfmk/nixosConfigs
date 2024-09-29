{ pkgs, lib, ... }: {
  imports = [
    ./stylix.nix
    ./theme.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
