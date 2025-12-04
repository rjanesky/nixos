{ pkgs, ... }:
{
  security.rtkit.enable = true;

  services = {
    # Storage Cofiguration
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    # SSH Configuration
    openssh.enable = false;
    
    # Audio Configuration
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;     # this is what makes pavucontrol work
      jack.enable = true;
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

  # Configure GC Timer
  systemd.timers."nix-gc" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };
}