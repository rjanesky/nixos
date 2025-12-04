{ config, pkgs, ... }:

{
  home.username = "dhilbert";
  home.homeDirectory = "/home/dhilbert";

  home.stateVersion = "25.05"; 

  imports = [
      # Package Configuration
      ../../modules/home/packages.nix
  ];

  wayland.windowManager.hyprland.plugins = [
    pkgs.hyprlandPlugins.hyprscrolling
  ];

  programs.home-manager.enable = true;
}