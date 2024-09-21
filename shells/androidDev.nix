
{ pkgs ? import <nixpkgs> {} }:
with pkgs;
mkShell {

  nativeBuildInputs = [
    clang
    cmake
    ninja
    pkg-config

    gtk3  # Curiously `nix-env -i` can't handle this one adequately.
          # But `nix-shell` on this shell.nix does fine.
    pcre
    epoxy

    jdk11
    dart
    flutter
    android-studio
    android-tools
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath [
    fontconfig.lib
    sqlite.out
  ];
}
