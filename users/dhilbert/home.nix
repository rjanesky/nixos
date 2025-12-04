{ config, pkgs, ... }:

{
  home.username = "dhilbert";
  home.homeDirectory = "/home/dhilbert";

  home.stateVersion = "25.05"; 

  imports = [
      # Package Configuration
      ../../modules/home/packages.nix
      ../../modules/dotfiles/dotfiles.nix
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