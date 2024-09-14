{ pkgs, lib, ... }: {
  imports = [
  ./services/nh.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
