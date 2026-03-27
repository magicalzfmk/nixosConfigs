{
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
