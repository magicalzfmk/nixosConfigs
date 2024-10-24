{ config, pkgs, ... }:

{
  imports = [
    ./guiPrograms/default.nix
    ./other/stylix.nix
  ];
}
