{ pkgs, lib, ... }: {
  imports = [
    ./others/stylix.nix
    
    ./services/default.nix
    ./programs/default.nix
    ./devEnv/default.nix
  ];

#  module2.enable = lib.mkDefault true;
#  module3.enable = false;

}
