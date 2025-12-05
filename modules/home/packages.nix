{ config, pkgs, ... }:
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

    xdg.desktopEntries."youtube-music" = {
      name = "YouTube Music";
      comment = "YouTube Music web app";
      exec = "${pkgs.brave}/bin/brave --app=https://music.youtube.com/ --new-window --user-data-dir=${config.xdg.dataHome}/chromium-ytmusic --class=YouTubeMusic --ozone-platform=wayland --enable-features=UseOzonePlatform";
      terminal = false;
      type = "Application";
      categories = [ "AudioVideo" "Player" ];
      # Put a matching icon file in ~/.local/share/icons/youtube-music.png if you like
      icon = "youtube-music";
  };
}