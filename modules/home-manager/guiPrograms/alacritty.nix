{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [
        "$FLAKE/otherConfigs/alacritty/dracula.toml"
      ];
    };
  };
}
