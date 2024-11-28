{
  pkgs,
  inputs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  hardware.opentabletdriver.enable = true;

  # $NIX_PATH fix
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  # nix.channel.enable = false;
  # environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  # nix.nixPath = ["nixpkgs=flake:nixpkgs"];
  # nix.settings.nix-path = ["nixpkgs=${pkgs.path}"];
  nix.settings.nix-path = ["nixpkgs=${inputs.nixpkgs}"];

  # environment.variables = {
  #   NIX_PATH = ["nixpkgs=${inputs.nixpkgs}"];
  # };

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
