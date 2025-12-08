# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix

      # System modules
      ../../modules/system/boot.nix
      ../../modules/system/hardware-nvidia.nix
      ../../modules/system/services.nix
      ../../modules/system/locale.nix
      ../../modules/system/security.nix
      ../../modules/system/networking.nix
      ../../modules/system/packages.nix
      ../../modules/system/fonts.nix
      ../../modules/system/nix-settings.nix

      # features
      ../../modules/system/features/hypr-desktop-features.nix
      ../../modules/system/features/display-manager.nix

      # Quickshell
      inputs.dankMaterialShell.nixosModules.greeter
    ];
  
  features.hypr-desktop.enable = true;
  #features.display-manager.enable = true;

  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "hyprland";  # Or "hyprland" or "sway"
  };

  boot.initrd.luks.devices."luks-622ace97-1f45-4926-92fb-117ee1d697d4".device = "/dev/disk/by-uuid/622ace97-1f45-4926-92fb-117ee1d697d4";

  system.stateVersion = "25.05"; # Did you read the comment?
}
