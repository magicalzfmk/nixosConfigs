{
  flake.nixosModules.nh = {pkgs, ...}: {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 5d --keep 2";
    };

    environment.systemPackages = with pkgs; [
      nh
      nvd
      nix-output-monitor
    ];
  };
}
