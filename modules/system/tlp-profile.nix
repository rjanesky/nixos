{ pkgs, ... }:
{
  services.tlp = {
    enable = true;

    settings = {
      # “Trickle charging” avoidance:
      # Don’t start charging again until you’ve discharged below this (%).
      START_CHARGE_THRESH_BAT0 = 75;

      # Max charge cap: stop charging at this (%).
      STOP_CHARGE_THRESH_BAT0  = 80;
    };
  };
}