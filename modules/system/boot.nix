{ pkgs, ... }:

{
  boot = {
    initrd.luks.devices."luks-622ace97-1f45-4926-92fb-117ee1d697d4".device = "/dev/disk/by-uuid/622ace97-1f45-4926-92fb-117ee1d697d4";

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