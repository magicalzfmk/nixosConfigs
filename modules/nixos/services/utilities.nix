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

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  environment.systemPackages = with pkgs; [
    git
    pandoc
    neofetch
    lf
    brightnessctl

    neovim
    nixd
    alejandra
  ];
}
