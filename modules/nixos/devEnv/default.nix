{ pkgs, lib, ... }: {
  imports = [
    ./android.nix
    ./development.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
