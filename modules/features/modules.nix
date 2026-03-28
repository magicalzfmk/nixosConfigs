{
  flake.nixosModules.flatpak = {pkgs, ...}: {
    services.flatpak.enable = true;

    systemd.services.flatpak-repo = {
      wantedBy = ["multi-user.target"];
      path = [pkgs.flatpak];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };

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

  flake.homeModules.git = {
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
}
