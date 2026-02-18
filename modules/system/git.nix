# Git version control: user identity, default branch, and convenience aliases.
{config, ...}: {
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "magicalzfmk";
          email = "mitanshkataria73@gmail.com";
        };
        init.defaultBranch = "main";
        alias = {
          pm = "push github main";
          po = "push origin main";
          co = "checkout";
          cm = "commit -a";
        };
      };
    };
  };

  # Also needed system-wide for root / scripts
  flake.modules.nixos.git = {pkgs, ...}: {
    environment.systemPackages = [pkgs.git];
  };
}
