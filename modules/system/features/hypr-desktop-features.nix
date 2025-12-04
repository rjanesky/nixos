{ lib, config, pkgs, ... }:
let
  cfg = config.features.hypr-desktop;
in
{
  options.features.hypr-desktop.enable =
    lib.mkEnableOption "Hyprland desktop packages";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.fuzzel
      pkgs.mako
      pkgs.foot

      pkgs.nautilus

      #pkgs.swaylock-effects

      pkgs.hyprlock
      pkgs.hyprpaper

      # logout / power management
      pkgs.wlogout
    ];

    # TODO: Declare script used to toggle waybar visibility
    programs.waybar = {
      enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
      # You may also need to configure preferred portals here
      config.preferred."org.freedesktop.impl.portal.FileChooser" = "org.gnome.Nautilus";
    };
    
    programs.hyprland = {
      enable = true;
      withUWSM = true; # recommended for most users
      xwayland.enable = true; # Xwayland can be disabled.
    };


    # Enable performance optimizations for gaming
    programs.gamemode.enable = true;

    #security.pam.services.swaylock = {};
  };
}
