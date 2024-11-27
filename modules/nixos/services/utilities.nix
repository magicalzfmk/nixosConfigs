{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  hardware.opentabletdriver.enable = true;

  # $NIX_PATH fix
  # nix.registry.nixpkgs.flake = nixpkgs;
  # nix.channel.enable = false;
  # environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
  # nix.nixPath = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";

  # environment.sessionVariables = {
  #   NIX_PATH = "nixpkgs=${inputs.nixpkgs}";
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
