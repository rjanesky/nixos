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
      ../../modules/system/logging.nix
      ../../modules/system/tailscale.nix
      ../../modules/system/ollama.nix
      ../../modules/system/docker.nix

      # features
      ../../modules/system/features/hypr-desktop-features.nix
      ../../modules/system/features/display-manager.nix

      # Quickshell
      inputs.dankMaterialShell.nixosModules.greeter
    ];

  features.hypr-desktop.enable = true;

  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "hyprland";  # Or "hyprland" or "sway"
  };

  # Add X11 + XFCE without enabling any display manager
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;  # no DM
    #desktopManager.xfce.enable = true;
  };

  # Enable xrdp and have it start XFCE
  services.xrdp = {
    enable = true;
    defaultWindowManager = "startxfce4";
    openFirewall = false;
  };
  

  environment.etc."searxng/settings.yml".text = ''
    use_default_settings: true

    server:
      # Must be set; can be any long random string
      secret_key: "CHANGE_ME_TO_A_LONG_RANDOM_STRING"

    search:
      formats:
        - html
        - json
  '';

  boot.initrd.luks.devices."luks-622ace97-1f45-4926-92fb-117ee1d697d4".device = "/dev/disk/by-uuid/622ace97-1f45-4926-92fb-117ee1d697d4";

  system.stateVersion = "25.05"; # Did you read the comment?
}
