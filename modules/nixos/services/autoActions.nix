{...}: {
  # nh clean enabled
  #nix.gc = {
  #  automatic = true;
  #  dates = "weekly";
  #  options = "--delete-older-than 3d"; #1w
  #};

  nix.settings.auto-optimise-store = true;
}
