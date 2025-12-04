{ pkgs, ... }:
{
  home.packages = [
    # Audio
    pkgs.pavucontrol

    # Browser
    pkgs.brave

    # Communication
    pkgs.discord

    # Editor
    pkgs.vscodium

    # File Manager
    pkgs.yazi
    pkgs.nemo

    # Gaming
    pkgs.steam

    # Terminal 
    pkgs.foot

    # Tools
    pkgs.cmatrix

    # Photography
    pkgs.darktable
    pkgs.krita

    # Utilities
    pkgs.htop
    pkgs.fastfetch

    pkgs.zip

    # Version Control
    pkgs.gh

    # Windows Compatability
    pkgs.protonup-qt
    pkgs.lutris
  ];
}