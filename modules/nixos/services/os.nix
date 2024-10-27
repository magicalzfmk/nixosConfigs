{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cmake
    clang-tools
  ];
}
