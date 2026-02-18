# PipeWire audio stack (NixOS) and music/audio application packages.
# Firewall ports for Nicotine+ / SoulSeek are opened here too.
{config, ...}: {
  flake.modules.nixos.audio = {pkgs, ...}: {
    # PipeWire
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      audio.enable = true;
    };

    # SoulSeek ports
    networking.firewall.allowedTCPPorts = [2234 2242];
    networking.firewall.allowedUDPPorts = [2234 2242];

    # Packages
    environment.systemPackages = with pkgs; [
      pear-desktop
      lollypop
      nicotine-plus
      lrcget
      picard
      spek
    ];
  };
}
