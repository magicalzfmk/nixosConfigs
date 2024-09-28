
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
    
    libuuid  # for mount.pc
    xorg.libXdmcp.dev
    libsepol.dev
    libthai.dev
    libdatrie.dev
    libxkbcommon.dev
    dbus.dev
    at-spi2-core.dev
    xorg.libXtst.out
    pcre2.dev
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath [
    fontconfig.lib
    sqlite.out
  ];
  
  shellHook = ''
    echo "android dev env preparing!"
    export JAVA_HOME=${pkgs.jdk.home}
    export FLUTTER_ROOT=${pkgs.flutter}/bin
    export PATH="$PATH:$FLUTTER_ROOT/bin"
    echo "Development environment is set up."
  '';
}
