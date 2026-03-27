{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.laptopHPHardware = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/18173319-b78d-4a8f-b1cf-aede8b0bfb2c";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/BBFB-88F7";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/1f45436c-ba9e-464b-bcc0-ef6168bba574";
      fsType = "ext4";
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/25f1eb6d-6972-4095-9c53-381399d05e32";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
