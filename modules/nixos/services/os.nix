{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    cmake
    clang-tools
    
  ];
}
