let
  userName = "zfmk";
in
  {config, ...}: {
    flake.nixosModules.vm = {pkgs, ...}: {
      programs.dconf.enable = true;

      users.users.${userName}.extraGroups = ["libvirtd"];

      environment.systemPackages = with pkgs; [
        virt-manager
        virt-viewer
        spice
        spice-gtk
        spice-protocol
        virtio-win
        win-spice
      ];

      virtualisation = {
        libvirtd = {
          enable = true;
          qemu.swtpm.enable = true;
        };
        spiceUSBRedirection.enable = true;
      };

      services.spice-vdagentd.enable = true;
    };
  }
