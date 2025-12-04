{ pkgs, ... }:

{
  boot = {
    initrd.luks.devices."luks-5a02de2c-5ef7-4ea2-b405-a9987144cde9".device = "/dev/disk/by-uuid/5a02de2c-5ef7-4ea2-b405-a9987144cde9";

    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
        configurationLimit = 12;
      };
    };
  };
}