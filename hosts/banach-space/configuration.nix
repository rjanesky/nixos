# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }:

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
      ../../modules/system/power-profiles.nix
      ../../modules/system/logging.nix

      # features
      ../../modules/system/features/niri-desktop-features.nix
      ../../modules/system/features/hypr-desktop-features.nix
      ../../modules/system/features/display-manager.nix

     # greeter
     inputs.dankMaterialShell.nixosModules.greeter
    ];
  
  features.hypr-desktop.enable = true;

  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "hyprland";  # Or "hyprland" or "sway"
  };

  boot.initrd.luks.devices."luks-3c393919-8ae8-4d4c-b93c-849e9a1e6562".device = "/dev/disk/by-uuid/3c393919-8ae8-4d4c-b93c-849e9a1e6562";

  system.stateVersion = "25.05"; # Did you read the comment?
}
