{ config, inputs, pkgs, ... }:

{
  home.username = "dhilbert";
  home.homeDirectory = "/home/dhilbert";

  home.stateVersion = "25.05"; 

  imports = [
      # Package Configuration
      ../../modules/home/packages.nix
      ../../modules/home/dotfiles/dotfiles.nix

      ../../modules/home/ui/cursor.nix

      # Quickshell
      inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  programs.home-manager.enable = true;

  programs.dankMaterialShell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dankMaterialShell changes
    };
    
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableClipboard = true;            # Clipboard history manager
    enableVPN = true;                  # VPN management widget
    enableBrightnessControl = true;    # Backlight/brightness controls
    enableColorPicker = true;          # Color picker tool
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableSystemSound = true;          # System sound effects
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "dhilbert";
      user.email = "dhilbert@hilbert-space.com";
      init.defaultBranch = "master";
    };
  };
}