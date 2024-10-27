{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
  ];

  shellHook = ''
    echo "Shell Hook is running!"
  '';
}
