{ pkgs, ... }:

{
  home.packages = [
    pkgs.hyprpaper
  ];

  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
    force = true;
  };

  home.file.".config/waybar" = {
    source = ./waybar;
    recursive = true;
    force = true;
  };
}