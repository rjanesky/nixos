# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix

      # System modules
      ../../modules/system/boot.nix
      ../../modules/system/hardware.nix
      ../../modules/system/services.nix
      ../../modules/system/locale.nix
      ../../modules/system/security.nix
      ../../modules/system/networking.nix
      ../../modules/system/packages.nix
      ../../modules/system/fonts.nix
      ../../modules/system/nix-settings.nix

      # features
      ../../modules/system/features/niri-desktop-features.nix
      ../../modules/system/features/hypr-desktop-features.nix
      ../../modules/system/features/display-manager.nix
    ];
  
  features.hypr-desktop.enable = true;
  features.display-manager.enable = true;

  boot.initrd.luks.devices."luks-5a02de2c-5ef7-4ea2-b405-a9987144cde9".device = "/dev/disk/by-uuid/5a02de2c-5ef7-4ea2-b405-a9987144cde9";

  system.stateVersion = "25.05"; # Did you read the comment?
}
