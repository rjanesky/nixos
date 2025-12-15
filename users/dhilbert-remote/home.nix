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

  home.packages = with pkgs; [
    xfce.xfconf
    xfce.xfce4-session
    xfce.xfce4-panel
    xfce.xfce4-settings
    xfce.thunar
    xfce.xfce4-appfinder  # application launcher
    xfce.xfce4-terminal
    xfce.xfce4-power-manager
    xfce.xfwm4
    xfce.garcon    # menu library\
    xfce.tumbler   # thumbnails (optional, but nice)
    xfce.exo
    xfce.xfdesktop
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "dhilbert";
      user.email = "dhilbert@hilbert-space.com";
      init.defaultBranch = "master";
    };
  };

  home.file.".xsession" = {
    executable = true;
    text = ''
      # Pull in Home Manager’s exported environment (PATH, XDG_*, etc.)
      if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      fi

      # Be explicit (xrdp sessions are often "too clean")
      export XDG_CONFIG_DIRS="$HOME/.nix-profile/etc/xdg:/run/current-system/sw/etc/xdg:/etc/xdg"
      export XDG_DATA_DIRS="$HOME/.nix-profile/share:/run/current-system/sw/share:/usr/share"

      exec startxfce4
    '';
  };

  home.file.".xinitrc" = {
    executable = true;
    text = ''
      # Pull in Home Manager’s exported environment (PATH, XDG_*, etc.)
      if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      fi

      # Be explicit (xrdp sessions are often "too clean")
      export XDG_CONFIG_DIRS="$HOME/.nix-profile/etc/xdg:/run/current-system/sw/etc/xdg:/etc/xdg"
      export XDG_DATA_DIRS="$HOME/.nix-profile/share:/run/current-system/sw/share:/usr/share"

      exec startxfce4
    '';
  };
}