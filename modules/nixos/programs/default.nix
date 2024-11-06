{...}: {
  imports = [
    ./audio.nix
    ./games.nix
    ./ui.nix
    ./utilities.nix
    ./vm.nix
  ];

  #  module2.enable = lib.mkDefault true;
  #  module3.enable = false;
}
