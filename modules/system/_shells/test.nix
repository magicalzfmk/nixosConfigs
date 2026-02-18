{
  pkgs,
  ...
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
    git
  ];

  shellHook = ''
    echo "Setting up environment for tachitatsu..."

    # Clone the tachitatsu repository (only if it doesn't exist)
    if [ ! -d tachitatsu ]; then
      echo "Cloning tachitatsu repository..."
      git clone https://github.com/odedro987/tachitatsu
    else
      echo "tachitatsu repository already exists.  Skipping clone."
    fi

    # Navigate to the tachitatsu directory
    cd tachitatsu

    # Install Python dependencies using pip
    echo "Installing Python dependencies..."
    ${pkgs.python3Packages.pip}/bin/pip install -r requirements.txt

    echo "Environment setup complete!  You can now run tachitatsu scripts."
    echo "Example: python src/main.py <backup_file_name>"
  '';
}

