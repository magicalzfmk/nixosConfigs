# nh: a friendly NixOS / Home-Manager rebuild helper with automatic
# store garbage collection. Also installs nvd and nix-output-monitor.
{config, ...}: {
  flake.modules.nixos.nh = {pkgs, ...}: {
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
