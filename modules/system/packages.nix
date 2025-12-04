{ pkgs, ... }:
{
  # System Packages
  environment.systemPackages = with pkgs; [        
    # Text Editors
    nano

    # Security
    keepassxc

    # Version Control
    git
  
    # Utilities 
    #brightnessctl
    wget
    curl
    gnome-disk-utility
    usbimager

    # Desktop Portals
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome

    # X Compatibility
    xwayland-satellite
  ];
}