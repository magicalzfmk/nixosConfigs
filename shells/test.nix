{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.jdk11
  ];

  shellHook = ''
    echo "Shell Hook is running!"
  '';
}
