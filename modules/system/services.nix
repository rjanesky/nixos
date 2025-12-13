{ pkgs, ... }:
{
  security.rtkit.enable = true;

  services = {
    # Storage Cofiguration
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    
    # Audio Configuration
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;     # this is what makes pavucontrol work
      jack.enable = true;
    };

    pipewire.extraConfig.pipewire."10-alsa" = {
      "context.properties" = {
      "default.clock.allowed-rates" = [ 44100 48000 88200 96000 ];
      "default.clock.rate" = 44100;
      "default.clock.quantum" = 1024;
    };
};
  };

  services.libinput.enable = true;
  services.libinput.touchpad = {
    # often influences the same libinput settings the compositor reads
    naturalScrolling = true;
    disableWhileTyping = true;
    tapping = false;
    clickMethod = "clickfinger";
  };

  services.flatpak.enable = true;

  services.xrdp = {
    enable = true;
    openFirewall = false;
  };

  # Configure GC Timer
  systemd.timers."nix-gc" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };
}