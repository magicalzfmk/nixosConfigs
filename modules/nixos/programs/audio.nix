{pkgs, ...}: {
  # soulseek1 soulseek2
  networking.firewall.allowedUDPPorts = [2234 2242];
  networking.firewall.allowedTCPPorts = [2234 2242];

  environment.systemPackages = with pkgs; [
    youtube-music
    lollypop

    nicotine-plus
    lrcget
    picard
    spek
  ];
}
