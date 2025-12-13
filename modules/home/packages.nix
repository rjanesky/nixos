{ config, pkgs, ... }:
{
  home.packages = [
    # Audio
    pkgs.pavucontrol

    # Browser
    pkgs.brave

    # Bittorrent
    pkgs.transmission_4-gtk

    # Communication
    pkgs.discord
    pkgs.session-desktop

    # Crypto
    pkgs.monero-gui
    pkgs.monero-cli
    pkgs.ledger-live-desktop

    # Editor
    pkgs.vscodium

    # File Manager
    pkgs.yazi
    pkgs.nemo

    # Gaming
    pkgs.steam

    # Password Management
    pkgs.bitwarden-desktop

    # Media
    pkgs.cava

    # Notes
    pkgs.logseq
    pkgs.obsidian

    # Terminal 
    pkgs.foot

    # Tools
    pkgs.cmatrix
    pkgs.cowsay
    pkgs.fortune

    # Photography
    pkgs.darktable
    pkgs.krita

    # Utilities
    pkgs.htop
    pkgs.fastfetch

    pkgs.zip

    # Version Control
    pkgs.gh

    # VPN
    pkgs.wireguard-tools 
    pkgs.protonvpn-gui

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

   xdg.desktopEntries."discord" = {
    name = "Discord";
    comment = "Discord PWA";
    exec = "${pkgs.brave}/bin/brave --app=https://discord.com/channels/@me --new-window --user-data-dir=${config.xdg.dataHome}/chromium-discord --class=Discord --ozone-platform=wayland --enable-features=UseOzonePlatform";
    terminal = false;
    type = "Application";
    categories = [  ];
    # Put a matching icon file in ~/.local/share/icons/youtube-music.png if you like
    icon = "Discord";
  };
}