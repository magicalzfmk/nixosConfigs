{...}: {
  imports = [
    ./android.nix
    ./development.nix
    ./zsh.nix
  ];

  #  module2.enable = lib.mkDefault true;
  #  module3.enable = false;
}
