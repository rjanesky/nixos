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
      pkgs.libnotify
      pkgs.mako
      pkgs.foot

      pkgs.nautilus

      # logout / power management
      pkgs.wlogout
    ];

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

    programs.fish.enable = true;

    programs.bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    # Enable performance optimizations for gaming
    programs.gamemode.enable = true;
  };
}
