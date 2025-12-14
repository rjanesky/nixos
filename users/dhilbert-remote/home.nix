{ config, inputs, pkgs, ... }:

{
  home.username = "dhilbert-remote";
  home.homeDirectory = "/home/dhilbert-remote";

  home.stateVersion = "25.05"; 

  imports = [
      # Package Configuration
      ../../modules/home/packages.nix
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "dhilbert";
      user.email = "dhilbert@hilbert-space.com";
      init.defaultBranch = "master";
    };
  };
}