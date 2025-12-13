{ pkgs, ... }:
{
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Optional but recommended on laptops:
  #services.tlp = {
  #  enable = true;
  #  settings = {
  #    CPU_SCALING_GOVERNOR_ON_AC = "performance";
  #    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #    # Fine-tune later if you like
  #  };
  #};

  # powertop autotune is also handy
  #powerManagement.powertop.enable = true;
}
