{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  hardware.opentabletdriver.enable = true;

  # nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  environment.systemPackages = with pkgs; [
    git
    alacritty
    starship
    pandoc
    neofetch
    lf
    brightnessctl
    blueberry
    statix
    ffmpeg_6

    # Neovim and modules
    neovim
    nixd
    alejandra
  ];
}
