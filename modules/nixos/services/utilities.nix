{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  hardware.opentabletdriver.enable = true;

  # nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  environment.systemPackages = with pkgs; [
    # CLI Stuff
    git
    neofetch
    lf

    # OS
    cmake
    clang-tools

    pandoc # Cool File Type Converter (Using with Obsidian)
    ffmpeg_6

    # Terminal Stuff
    alacritty
    starship

    brightnessctl # Brightness Control for waybar
    gvfs # Virtual Filesystem support library
    blueberry # Bluetooth GUI App
    statix # Check antipattern in code
    zenity # Window Prompt Input Creator

    # Neovim and modules
    neovim # Best? Based AF
    nixd # Nix context clue and suggestion provider
    alejandra # Code formatter

    # Screenshot
    grim
    slurp
    wl-clipboard
    textsnatcher
    (flameshot.override {enableWlrSupport = true;})
    wlroots
  ];
}
